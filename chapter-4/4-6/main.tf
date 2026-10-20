
resource "google_compute_network" "vpc" {
  name = var.vpc_name
}

resource "google_compute_firewall" "fw" {
  for_each = toset(var.ports)

  name    = "fw-for-${each.value}"
  network = google_compute_network.vpc.id

  allow {
    ports    = [each.value]
    protocol = "tcp"
  }
}
