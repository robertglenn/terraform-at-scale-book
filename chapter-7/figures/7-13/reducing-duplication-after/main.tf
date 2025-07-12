
resource "google_compute_network" "tas-7-13-vpc" {
  name                    = "vpc-terraform-at-scale-7-13"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" tas-7-13-snet-01 {
    for_each = { for snet in var.snet_configs : snet.name => snet }

    name          = each.value.name
    ip_cidr_range = each.value.cidr
    region        = each.value.region
    network       = google_compute_network.tas-7-13-vpc.id
}
