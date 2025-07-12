
resource "google_compute_subnetwork" tas-7-7-snet-01 {
    name          = var.snet_01_name
    ip_cidr_range = var.snet_01_cidr
    region        = var.snet_01_region
    network       = var.tas_7_7_vpc_id
}

resource "google_compute_subnetwork" tas-7-7-snet-02 {
    name          = var.snet_02_name
    ip_cidr_range = var.snet_02_cidr
    region        = var.snet_02_region
    network       = var.tas_7_7_vpc_id
}

resource "google_compute_subnetwork" tas-7-7-snet-03 {
    name          = var.snet_03_name
    ip_cidr_range = var.snet_03_cidr
    region        = var.snet_03_region
    network       = var.tas_7_7_vpc_id
}
