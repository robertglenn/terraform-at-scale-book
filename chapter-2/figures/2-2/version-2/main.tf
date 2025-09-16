
resource google_compute_network "tas-2-2-vpc-v2" {
  name = "vpc-terraform-at-scale-2-2-v2"
}

resource google_compute_firewall "tas-2-2-fw-v2" {
  name    = "fw-terraform-at-scale-2-2-v2"
  network = google_compute_network.tas-2-2-vpc-v2.self_link

  allow {
    protocol = "icmp"
  }
}
