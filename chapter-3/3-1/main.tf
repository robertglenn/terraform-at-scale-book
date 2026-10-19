
resource "google_compute_firewall" "http" {
  name    = var.http_firewall_name
  network = var.vpc_network

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
resource "google_compute_firewall" "https" {
  count = !(var.http_only) ? 1 : 0

  name    = var.https_firewall_name
  network = var.vpc_network

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}
