
locals {
  vms_with_attached_disks = {
    for key, vm in var.vm_inputs : key => vm
    if vm.has_attached_disk
  }
  vms_needing_second_nic = {
    for key, vm in var.vm_inputs : key => vm
    if vm.has_second_nic
  }
}
