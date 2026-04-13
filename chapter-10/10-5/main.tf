
resource "google_compute_instance" "self_link" {
  name         = "tas-10-5-gce-1"
  machine_type = "n2-standard-16"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    # Self-link includes the correct Project ID
    subnetwork = "projects/network-10-5/regions/us-west1/subnetworks/snet-10"
  }
}

resource "google_compute_instance" "name" {
  name         = "tas-10-5-gce-2"
  machine_type = "n2-standard-16"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    # subnetwork_project is not specified; will default to provider project
    # this will produce an error in the apply phase
    subnetwork = "snet-10"
  }
}
