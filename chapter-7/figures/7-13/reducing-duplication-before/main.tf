
resource "google_compute_network" "tas-7-16-vpc" {
  name                    = "vpc-terraform-at-scale-7-16"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" tas-7-16-snet-01 {
    name          = var.snet_01_name
    ip_cidr_range = var.snet_01_cidr
    region        = var.snet_01_region
    network       = google_compute_network.tas-7-16-vpc.id
}

resource "google_compute_subnetwork" tas-7-16-snet-02 {
    name          = var.snet_02_name
    ip_cidr_range = var.snet_02_cidr
    region        = var.snet_02_region
    network       = google_compute_network.tas-7-16-vpc.id
}

resource "google_compute_subnetwork" tas-7-16-snet-03 {
    name          = var.snet_03_name
    ip_cidr_range = var.snet_03_cidr
    region        = var.snet_03_region
    network       = google_compute_network.tas-7-16-vpc.id
}

resource "google_compute_subnetwork" tas-7-16-snet-04 {
    name          = var.snet_04_name
    ip_cidr_range = var.snet_04_cidr
    region        = var.snet_04_region
    network       = google_compute_network.tas-7-16-vpc.id
}

resource "google_compute_subnetwork" tas-7-16-snet-05 {
    name          = var.snet_05_name
    ip_cidr_range = var.snet_05_cidr
    region        = var.snet_05_region
    network       = google_compute_network.tas-7-16-vpc.id
}

resource "google_compute_subnetwork" tas-7-16-snet-06 {
    name          = var.snet_06_name
    ip_cidr_range = var.snet_06_cidr
    region        = var.snet_06_region
    network       = google_compute_network.tas-7-16-vpc.id
}

resource "google_compute_subnetwork" tas-7-16-snet-07 {
    name          = var.snet_07_name
    ip_cidr_range = var.snet_07_cidr
    region        = var.snet_07_region
    network       = google_compute_network.tas-7-16-vpc.id
}

resource "google_compute_subnetwork" tas-7-16-snet-08 {
    name          = var.snet_08_name
    ip_cidr_range = var.snet_08_cidr
    region        = var.snet_08_region
    network       = google_compute_network.tas-7-16-vpc.id
}

resource "google_compute_subnetwork" tas-7-16-snet-09 {
    name          = var.snet_09_name
    ip_cidr_range = var.snet_09_cidr
    region        = var.snet_09_region
    network       = google_compute_network.tas-7-16-vpc.id
}

resource "google_compute_subnetwork" tas-7-16-snet-10 {
    name          = var.snet_10_name
    ip_cidr_range = var.snet_10_cidr
    region        = var.snet_10_region
    network       = google_compute_network.tas-7-16-vpc.id
}
