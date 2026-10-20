
resource "google_compute_instance" "vms_list" {
  for_each = var.vm_region_map

  name         = "vm-3-19-${each.value}"
  machine_type = "n2-standard-2"

  boot_disk {}

  network_interface {}
}