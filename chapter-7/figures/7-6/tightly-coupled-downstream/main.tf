
resource "google_compute_subnetwork" tas-7-6-snet-01 {
    for_each = { for vpc in var.vpc_info : vpc.network_id => vpc }

    name          = each.value.snet1.subnet_name
    ip_cidr_range = each.value.snet1.subnet_cidr
    region        = each.value.snet1.subnet_region
    network       = each.value.network_id
}

resource "google_compute_subnetwork" tas-7-6-snet-02 {
    for_each = { for vpc in var.vpc_info : vpc.network_id => vpc }

    name          = each.value.snet2.subnet_name
    ip_cidr_range = each.value.snet2.subnet_cidr
    region        = each.value.snet2.subnet_region
    network       = each.value.network_id
}

resource "google_compute_subnetwork" tas-7-6-snet-03 {
    for_each = { for vpc in var.vpc_info : vpc.network_id => vpc }

    name          = each.value.snet3.subnet_name
    ip_cidr_range = each.value.snet3.subnet_cidr
    region        = each.value.snet3.subnet_region
    network       = each.value.network_id
}
