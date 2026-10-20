resource "google_compute_instance" "gce_vms" {
  for_each = var.vm_configs

  name         = each.value.name
  machine_type = each.value.machine_type
  # ...

  boot_disk {
    # ...
  }

  network_interface {
    # ...
  }
}