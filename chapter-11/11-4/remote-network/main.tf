
locals {
  root_from_vpc_name = (endswith(var.vpc_name, "-vpc") ?
  trimsuffix(var.vpc_name, "-vpc") : var.vpc_name)
  region_one_snet_name = "${local.root_from_vpc_name}-${var.region_one}-snet"
  region_two_snet_name = "${local.root_from_vpc_name}-${var.region_two}-snet"
}

resource "google_compute_network" "default" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "region_one" {
  name          = local.region_one_snet_name
  project       = var.project_id
  ip_cidr_range = var.region_one_cidr
  region        = var.region_one
  network       = google_compute_network.default.id
}

resource "google_compute_subnetwork" "region_two" {
  name          = local.region_two_snet_name
  project       = var.project_id
  ip_cidr_range = var.region_two_cidr
  region        = var.region_two
  network       = google_compute_network.default.id
}
