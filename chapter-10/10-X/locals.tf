
locals {
  cidr_check   = contains(cidrsubnets("10.0.0.0/16", 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4), var.snet_cidr)
  region_check = startswith(var.snet_region, "us-")
  zone_check   = contains(data.google_compute_zones.available.names, var.instance_zone)
  cpu_sizes    = ["2", "4", "8", "16", "32", "48"]
  last_token   = split("-", var.machine_type)[-1]
  first_check  = startswith(var.machine_type, "n2-standard-")
  second_check = contains(local.cpu_sizes, local.last_token)
  type_check   = local.first_check && local.second_check
  boot_check   = startswith(var.boot_image, "debian") || startswith(var.boot_image, "ubuntu")
}
