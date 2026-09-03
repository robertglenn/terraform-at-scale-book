
resource "google_compute_network" "tas_6_5_vpc" {
  name                    = "vpc-terraform-at-scale-6-5"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "tas_6_5_snets" {
  for_each = { for snet in var.snet_configs : snet.name => snet }

  name          = each.value.name
  project       = var.project_id
  ip_cidr_range = each.value.cidr
  region        = each.value.region
  network       = google_compute_network.tas_6_5_vpc.id
}
