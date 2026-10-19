
resource "google_compute_network" "tas_6_vpc" {
  name                    = "vpc-terraform-at-scale-6"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "tas_6_snet" {
  for_each = { for snet in var.snet_configs : snet.name => snet }

  name          = each.value.name
  ip_cidr_range = each.value.cidr
  region        = each.value.region
  network       = google_compute_network.tas_6_vpc.id
}
