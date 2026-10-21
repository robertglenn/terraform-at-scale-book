
resource "google_compute_instance" "instances" {
  name         = "gce-4-17"
  machine_type = "n2-standard-2"

  boot_disk {}

  network_interface {
    network = var.network_name
  }

  dynamic "scratch_disk" {
    for_each = var.scratch_map

    content {
      interface = scratch_disk.value.interface
    }
  }

  lifecycle {
    postcondition {
      condition = (self.network_interface.network != "default"
      && length(self.scratch_disk) < 2)
      error_message = "No default network; at most 1 scratch disk"
    }
  }
}
