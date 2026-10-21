
resource "google_compute_subnetwork" "default" {
  for_each = { for stack in var.stack_data : stack.app_name => stack }

  network = var.network_id
  name    = "${each.value.app_name}-snet"
  region  = each.value.region
}

resource "google_compute_instance" "default" {
  for_each = { for stack in var.stack_data : stack.app_name => stack }

  name         = each.value.app_name
  machine_type = var.machine_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default[each.key].self_link
  }

  service_account {
    email  = google_service_account.default[each.key].email
    scopes = ["cloud-platform"]
  }
}

resource "google_service_account" "default" {
  for_each = { for stack in var.stack_data : stack.app_name => stack }

  account_id = "${each.value.app_name}-account"
}
