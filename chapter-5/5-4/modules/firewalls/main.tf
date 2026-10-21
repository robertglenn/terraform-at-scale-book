
resource "google_compute_firewall" "ingress" {
  name    = "fw-5-4-${each.value}"
  network = var.network

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = var.ranges
}

resource "google_compute_firewall" "egress" {
  name    = "fw-5-4-${each.value}-egress"
  network = var.network

  direction = "EGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}
