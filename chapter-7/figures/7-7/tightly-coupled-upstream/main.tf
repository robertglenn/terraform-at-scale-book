
resource "google_compute_network" "tas-7-7-vpc" {
  name                    = "vpc-terraform-at-scale-7-7"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" tas-7-7-fw-allow-http {
    name          = var.fw_allow_http_name
    network       = google_compute_network.tas-7-7-vpc.id

    allow {
        protocol = "tcp"
        ports    = ["80", "443"]
    }
}

resource "google_compute_firewall" tas-7-7-fw-deny-icmp {
    name          = var.fw_deny_icmp_name
    network       = google_compute_network.tas-7-7-vpc.id

    deny {
        protocol = "icmp"
    }
}
