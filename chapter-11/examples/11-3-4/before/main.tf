
# *****************************************************************************
# Locals and Data Sources
# *****************************************************************************
locals {
  vpc_name                = "tas-11-vpc"
  location                = upper(split("-", local.region_one)[0])
  bucket_name             = "tas-11-bucket"
  developer_group         = "group:${var.developer_group_email}"
  region_one              = data.google_compute_zones.region_one.id
  zone_one                = data.google_compute_zones.region_one.names[0]
  region_one_snet_name    = "tas-11-${local.region_one}-snet"
  region_one_disk_name    = "tas-11-${local.region_one}-disk"
  region_one_compute_name = "tas-11-${local.region_one}-comp"
  region_two              = data.google_compute_zones.region_two.id
  zone_two                = data.google_compute_zones.region_two.names[0]
  region_two_snet_name    = "tas-11-${local.region_two}-snet"
  region_two_disk_name    = "tas-11-${local.region_two}-disk"
  region_two_compute_name = "tas-11-${local.region_two}-comp"
}

data "google_compute_zones" "region_one" {
  region = var.region_one
}

data "google_compute_zones" "region_two" {
  region = var.region_two
}

# *****************************************************************************
# Network Components
# *****************************************************************************
resource "google_compute_network" "default" {
  name                    = local.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "region_one" {
  name          = local.region_one_snet_name
  project       = var.project_id
  ip_cidr_range = var.region_one_cidr
  region        = local.region_one
  network       = google_compute_network.default.id
}

resource "google_compute_subnetwork" "region_two" {
  name          = local.region_two_snet_name
  project       = var.project_id
  ip_cidr_range = var.region_two_cidr
  region        = local.region_two
  network       = google_compute_network.default.id
}

# *****************************************************************************
# Compute Instances
# *****************************************************************************
resource "google_compute_disk" "region_one" {
  name    = local.region_one_disk_name
  project = var.project_id
  type    = var.disk_type
  zone    = local.zone_one
  size    = var.disk_size

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_instance" "region_one" {
  name         = local.region_one_compute_name
  project      = var.project_id
  machine_type = var.machine_type
  zone         = local.zone_one

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.region_one.self_link

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
  zone    = local.zone_two
  size    = var.disk_size

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_instance" "region_two" {
  name         = local.region_two_compute_name
  project      = var.project_id
  machine_type = var.machine_type
  zone         = local.zone_two

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.region_two.self_link

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

# *****************************************************************************
# Other Componets
# *****************************************************************************

resource "google_storage_bucket" "default" {
  name     = local.bucket_name
  project  = var.project_id
  location = local.location
}

resource "google_storage_bucket_iam_member" "bucket_admin" {
  bucket = google_storage_bucket.default.name
  role   = "roles/storage.admin"
  member = local.developer_group
}

resource "google_project_iam_member" "compute_admin" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = local.developer_group
}
