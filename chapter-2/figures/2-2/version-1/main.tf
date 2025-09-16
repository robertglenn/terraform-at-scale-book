
resource google_compute_network "tas-2-2-vpc-v1" {
  name = "vpc-terraform-at-scale-2-2-v1"
}

resource google_compute_firewall "tas-2-2-fw-v1" {
  name    = "fw-terraform-at-scale-2-2-v1"
  network = google_compute_network.tas-2-2-vpc-v1.name

  allow {
    protocol = "icmp"
  }
}
