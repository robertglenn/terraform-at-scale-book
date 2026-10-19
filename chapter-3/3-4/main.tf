
resource "google_compute_disk" "attached_disks" {
  for_each = {
    for key, vm in var.vm_inputs : key => vm
    if vm.has_attached_disk
  }

  name = each.value.name
}
