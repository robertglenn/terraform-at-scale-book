
locals {
  # Used by resources
  subnets = { for reg in local.first_10_regions :
    reg => { name : "snet-${reg}", region : reg }
  }
  vm_nics        = [for snet in local.subnets : snet.name]
  vm_name        = "vm-${local.first_10_regions[0]}-${local.image_type}"
  vm_description = "Description for ${local.vm_name}"
  # ...
  #Used by other locals
  first_10_regions = slice(data.google_compute_zones.avlble.names, 0, 10)
  image_type       = data.google_compute_images.avlble.images[0].self_link
  # ...
}

data "google_compute_zones" "avlble" {}

data "google_compute_images" "avlble" {}
