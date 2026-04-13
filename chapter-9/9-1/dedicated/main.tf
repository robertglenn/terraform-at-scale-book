
resource "google_compute_network" "default" {
  name    = "tas-9-1-combined-network"
  project = var.project_id
}

resource "google_compute_firewall" "app1" {
  name    = "tas-9-1-app1-fw"
  project = var.project_id
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_tags = ["app1_web"]
}

resource "google_compute_firewall" "app2" {
  name    = "tas-9-1-app2-fw"
  project = var.project_id
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_tags = ["app2_web"]
}
