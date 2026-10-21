
resource "google_compute_subnetwork" "default" {
  network = var.network_id
  name    = "${var.app_name}-snet"
  region  = var.region
}

resource "google_compute_instance" "default" {
  name         = var.app_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default.self_link
  }

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

resource "google_service_account" "default" {
  account_id = "${var.app_name}-account"
}
