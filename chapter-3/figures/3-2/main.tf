# The locals{} block appears here for convenience, only. Ideally, it is place in it's own locals.tf file

locals {
  augmented_vms_map = {
  for vm in var. vms_map : vm => merge(
      vm,
      {
        name        = "vm-${vm.app_id}-${slice(vm.machine_type, 0, 2)}-${slice(vm.zone, 0, 6)}"
        description = "Dedicated ${vm.machine_type} vm for app ${vm.app_id}"
      }
    )
  }
}

resource "google_compute_instance" vms-collection {
  for_each = local.augmented_vms_map
  
  name         = each.value.name
  description  = each.value.description
  zone         = each.value.zone
  machine_type = each.value.machine_type

  network_interface {
    network = each.value.network
  }

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }
}
