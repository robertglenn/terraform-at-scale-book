
locals {
  domain_root = split(".", var.network_data.domain)[0]
  range_names = { for range in var.network_data.ranges
  : range => join("", split(".", split("/", range))) }
}

resource "google_compute_network" "default" {
  name = "${local.domain_root}-vpc"
}

resource "google_compute_subnetwork" "default" {
  for_each = toset(var.network_data.ranges)

  name          = "${local.domain_root}-snet-${local.range_names[each.value]}"
  network       = google_compute_network.default.id
  ip_cidr_range = each.value
  region        = var.network_data.region
}
