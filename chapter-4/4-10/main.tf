
locals {
  # Subnet values
  first_10_regions = slice(data.google_compute_zones.avlble.names, 0, 10)
  subnets = { for reg in local.first_10_regions :
    reg => { name : "snet-${reg}", region : reg }
  }
  # Compute values
  vm_nics        = [for snet in local.subnets : snet.name]
  vm_name        = "vm-${local.first_10_regions[0]}"
  vm_description = "Description for ${local.vm_name}"
}

data "google_compute_zones" "avlble" {}
