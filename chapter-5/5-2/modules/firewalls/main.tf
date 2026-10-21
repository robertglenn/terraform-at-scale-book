
resource "google_compute_firewall" "default" {
  for_each = var.data

  name    = "fw-5-2-${each.value.region}"
  network = var.network

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.tcp_ports
  }

  source_ranges = each.value.from_ips
  target_tags   = each.value.target_tags
}
