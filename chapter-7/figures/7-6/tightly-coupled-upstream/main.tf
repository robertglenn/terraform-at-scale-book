
resource "google_compute_network" "tas-7-6-vpc" {
    for_each = var.vpc_names

    name                    = each.value
    auto_create_subnetworks = false
}

resource "google_compute_firewall" tas-7-6-fw-allow-http {
    for_each = google_compute_network.tas-7-6-vpc[*].id

    name          = "${var.fw_http_name} for VPC ${each.value}"
    network       = each.value

    allow {
        protocol = "tcp"
        ports    = ["80", "443"]
    }
}

resource "google_compute_firewall" tas-7-6-fw-deny-icmp {
    for_each = google_compute_network.tas-7-6-vpc[*].id

    name          = "${var.fw_icmp_name} for VPC ${each.value}"
    network       = each.value

    deny {
        protocol = "icmp"
    }
}
