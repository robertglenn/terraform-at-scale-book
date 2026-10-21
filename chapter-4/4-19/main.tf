
resource "google_compute_instance" "gce_vm" {

  name         = var.vm_name
  machine_type = var.vm_type

  boot_disk {

  }

  dynamic "attached_disk" {
    for_each = var.disk_configs

    content {
      source      = attached_disk.value.disk_link
      device_name = attached_disk.value.disk_device_name
    }
  }

  dynamic "network_interface" {
    for_each = var.nic_configs

    content {
      subnetwork = network_interface.value.subnet_name
      dynamic "access_config" {
        for_each = network_interface.value.public_access ? 1 : 0
        content {
          # Intentionally left blank to generate ephemeral IP
        }
      }
    }
  }
}
