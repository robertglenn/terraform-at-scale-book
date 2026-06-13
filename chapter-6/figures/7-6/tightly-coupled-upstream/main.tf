
resource "google_compute_network" "tas_6_vpc" {
  for_each = var.vpc_names

  name                    = each.value
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "tas_6_fw_allow_http" {
  for_each = google_compute_network.tas_6_vpc[*].id

  name    = "${var.fw_http_name} for VPC ${each.value}"
  network = each.value

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

resource "google_compute_firewall" "tas_6_fw_deny_icmp" {
  for_each = google_compute_network.tas_6_vpc[*].id

  name    = "${var.fw_icmp_name} for VPC ${each.value}"
  network = each.value

  deny {
    protocol = "icmp"
  }
}
