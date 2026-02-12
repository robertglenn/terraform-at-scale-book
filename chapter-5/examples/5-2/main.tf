
# Several variables and fields omitted for attempted brevity

variable "os_image" {
  description = "RHEL OS image for compute instance"
  type        = string

  validation {
    condition = strcontains(var.os_image, "rhel")
    error_message = "os_image must be a rhel image"
  }
}

variable "subnetworks" {
  description = "Subnetwork names for compute instance"
  type        = list(string)

  validation {
    condition = length(var.subnetworks) > 0
    error_message = "subnetworks must not be empty."
  }
}

data "google_compute_subnetwork" "supported" {
  for_each = var.subnetworks

  name = each.value
}

resource "google_compute_instance" "generic" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }

  dynamic "network_interface" {
    for_each = data.google_compute_subnetwork.supported

    content {
      subnetwork = each.self_link
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.optional

    content {
      source      = each.self_link
      device_name = each.key
    }
  }

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_disk" "optional" {
  for_each = { for disk in var.disk_data : disk.device_name => disk }

  name = "${google_compute_instance.generic.name}-${each.key}"
  type = "pd-ssd"
  zone = var.zone
  physical_block_size_bytes = each.value.size_bytes
}

resource "google_service_account" "default" {
  account_id   = "${google_compute_instance.generic.name}-account"
  display_name = "Service Account for ${google_compute_instance.generic.name}"
}
