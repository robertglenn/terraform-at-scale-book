

# -------------------------
# Super-Bundle Module
# -------------------------

module "app_trust" {
  source = "./modules/stack"

  app_name   = var.app_name
  project_id = var.app_trust_project
  os_image   = var.os_image
  trusted    = true
}

module "app_untrust" {
  source = "./modules/stack"

  app_name   = var.app_name
  project_id = var.app_untrust_project
  os_image   = var.os_image
}

# -------------------------
# Stack Module
# -------------------------

resource "google_compute_network" "default" {
  name = "${var.app_name}-vpc"
}

resource "google_compute_firewall" "default_deny_tcp" {
  count = var.trusted ? 0 : 1

  name     = "${var.app_name}-default-deny"
  network  = google_compute_network.default.self_link
  priority = 65535
  
  destination_ranges = ["0.0.0.0/0"]

  deny {
    protocol  = "tcp"
  }
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
    network = google_compute_network.default.self_link
  }

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

resource "google_service_account" "default" {
  account_id = "${var.app_name}-account"
}

