
locals {
  instance_map = {
    instance_1 = {
      name          = "vm-4-21-web-1"
      machine_type  = "n2-standard-2"
      instance_zone = "us-west1-a"
      network_tags  = ["web", "public"]
      image         = "ubuntu-os-cloud/ubuntu-2204-lts"
      network_names = ["vpc-4-21-trust", "vpc-4-21-untrust"]
      scratch_disk  = false
    }
    instance_2 = {
      name          = "vm-4-21-web-2"
      machine_type  = "n2-standard-2"
      instance_zone = "us-central1-a"
      network_tags  = ["web", "public"]
      image         = "ubuntu-os-cloud/ubuntu-2204-lts"
      network_names = ["vpc-4-21-trust", "vpc-4-21-untrust"]
      scratch_disk  = false
    }
    instance_3 = {
      name          = "vm-4-21-data-1"
      machine_type  = "n2-standard-8"
      instance_zone = "us-central1-b"
      network_tags  = ["data", "private"]
      image         = "ubuntu-os-cloud/ubuntu-2204-lts"
      network_names = ["vpc-4-21-untrust"]
      scratch_disk  = true
    }
  }
}

resource "google_compute_instance" "instances" {
  for_each = local.instance_map

  provider     = google-beta
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.instance_zone
  tags         = each.value.network_tags

  labels = {
    created_by = "terraform"
    bu_code    = "amer-eng"
  }

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }

  dynamic "network_interface" {
    for_each = toset(each.value.network_names)

    content {
      network = network_interface.value
      access_config {
        // Ephemeral public IP
      }
    }
  }

  dynamic "scratch_disk" {
    for_each = each.value.scratch_disk ? toset([each.value.scratch_disk]) : toset([])

    content {
      interface = "NVME"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}