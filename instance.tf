resource "google_compute_instance" "jenkins" {
  name         = "jenkins"
  machine_type = "e2-medium"
  zone         = "us-west1-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork  = google_compute_subnetwork.network-with-private-secondary-ip-ranges.name
    access_config {
      // Ephemeral public IP
    }
  }
}

resource "google_compute_instance" "nexus" {
  name         = "nexus"
  machine_type = "e2-medium"
  zone         = "us-west1-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}