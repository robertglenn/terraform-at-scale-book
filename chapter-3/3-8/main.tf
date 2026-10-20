
resource "google_compute_instance" "vms_collection" {
  for_each = var.vms_map

  name         = "vm-${each.value.app_id}-${each.value.machine_type}"
  description  = "${each.value.type} vm for app ${each.value.app_id}"
  zone         = each.value.zone
  machine_type = each.value.machine_type

  boot_disk {}

  network_interface {}
}
