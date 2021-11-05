resource "google_compute_firewall" "default" {
  name    = "mamz-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "8081", "1000-2000"]
  }

  source_tags = ["web"]
  target_tags = ["jenkins", "nexus"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}