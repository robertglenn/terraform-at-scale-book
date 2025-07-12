
resource "google_compute_network" tas-7-8-vpc {
    project = "terraform-at-scale-book"
    name    = "vpc-terraform-at-scale-7-8"
}

resource "google_compute_subnetwork" tas-7-8-snet {
    project       = "terraform-at-scale-book"
    name          = "subnetwork-terraform-at-scale-7-8"
    ip_cidr_range = "10.0.0.0/24"
    region        = "us-central1"
    network       = google_compute_network.tas-7-8-vpc.id
}

resource "google_compute_firewall" "tas-7-8-fw" {
    project = "terraform-at-scale-book"
    name    = "firewall-terraform-at-scale-7-8"
    network = google_compute_network.tas-7-8-vpc.self_link

    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["80", "443"]
    }
}
