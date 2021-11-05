resource "google_compute_firewall" "default1" {
  name    = "mamz-firewall-1"
  network = google_compute_network.vpc_network.name

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
