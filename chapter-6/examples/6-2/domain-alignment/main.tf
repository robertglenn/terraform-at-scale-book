
resource "google_compute_network" "tas_6_2_vpc" {
  project = "terraform-at-scale-book"
  name    = "vpc-terraform-at-scale-6-2"
}

resource "google_compute_subnetwork" "tas_6_2_snet" {
  project       = "terraform-at-scale-book"
  name          = "subnetwork-terraform-at-scale-6-2"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.tas_6_2_vpc.id
}

resource "google_compute_firewall" "tas_6_2_fw" {
  project = "terraform-at-scale-book"
  name    = "firewall-terraform-at-scale-6-2"
  network = google_compute_network.tas_6_2_vpc.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}
