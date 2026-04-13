
resource "google_compute_network" "example" {
  name                    = "tas-10-5-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "example" {
  name          = "tas-10-5-snet"
  ip_cidr_range = var.snet_cidr
  region        = var.snet_region
  network       = google_compute_network.example.id
}

resource "google_compute_instance" "self_link" {
  name         = "tas-10-5-gce-1"
  machine_type = var.machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    # Self-link includes the project ID
    subnetwork = google_compute_subnetwork.example.id
  }
}

resource "google_compute_instance" "name" {
  name         = "tas-10-5-gce-2"
  machine_type = var.machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    # subnetwork_project is not specified; will default to provider project
    subnetwork = google_compute_subnetwork.example.name
  }
}
