
resource "google_compute_network" "tas_2_2_vpc_v1" {
  name = "vpc-terraform-at-scale-2-2-v1"
}

resource "google_compute_firewall" "tas_2_2_fw_v1" {
  name    = "fw-terraform-at-scale-2-2-v1"
  network = google_compute_network.tas-2-2-vpc-v1.name

  allow {
    protocol = "icmp"
  }
}
