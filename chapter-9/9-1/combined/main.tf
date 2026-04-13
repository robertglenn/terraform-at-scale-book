
resource "google_compute_network" "default" {
  name = "tas-9-1-combined-network"
  project = var.project_id
}

resource "google_compute_firewall" "combined" {
  name    = "tas-9-1-combined-fw"
  project = var.project_id
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_tags = ["app1_web", "app2_web"]
}
