
resource google_compute_network "vpc" {
  name = var.network_name
}

resource google_compute_instance "instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network = var.network_name

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }

  depends_on = [ google_compute_network.vpc ]
}
