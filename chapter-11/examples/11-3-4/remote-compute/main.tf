
locals {
  region_one_disk_name    = "tas-11-${var.region_one}-disk"
  region_one_compute_name = "tas-11-${var.region_one}-comp"
  region_two_disk_name    = "tas-11-${var.region_two}-disk"
  region_two_compute_name = "tas-11-${var.region_two}-comp"
}

resource "google_compute_disk" "region_one" {
  name    = local.region_one_disk_name
  project = var.project_id
  type    = var.disk_type
  zone    = var.zone_one
  size    = var.disk_size

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_instance" "region_one" {
  name         = local.region_one_compute_name
  project      = var.project_id
  machine_type = var.machine_type
  zone         = var.zone_one

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
    }
  }

  network_interface {
    subnetwork = var.subnet_one_link

    access_config {}
  }

  attached_disk {
    source      = google_compute_disk.region_one.self_link
    device_name = "data-disk"
    mode        = "READ_WRITE"
  }

  lifecycle {
    ignore_changes = [ google_compute_disk.region_one ]
  }
}

resource "google_compute_disk" "region_two" {
  name    = local.region_two_disk_name
  project = var.project_id
  type    = var.disk_type
  zone    = var.zone_two
  size    = var.disk_size

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_instance" "region_two" {
  name         = local.region_two_compute_name
  project      = var.project_id
  machine_type = var.machine_type
  zone         = var.zone_two

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
    }
  }

  network_interface {
    subnetwork = var.subnet_two_link

    access_config {}
  }

  attached_disk {
    source      = google_compute_disk.region_two.self_link
    device_name = "data-disk"
    mode        = "READ_WRITE"
  }

  lifecycle {
    ignore_changes = [ google_compute_disk.region_two ]
  }
}
