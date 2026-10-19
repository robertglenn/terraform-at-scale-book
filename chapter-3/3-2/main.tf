
data "google_compute_regions" "available" {}

locals {
  three_supported_regions = slice(data.google_compute_regions.available.names, 0, 3)
}

resource "google_compute_instance" "instances" {
  for_each = { for idx, vm in var.vm_instance :
  vm.name => merge(vm, { index = idx }) }

  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = local.three_supported_regions[each.value.index % 3]

  boot_disk {}

  network_interface {}
}
