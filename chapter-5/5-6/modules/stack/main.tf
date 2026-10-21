
resource "google_storage_bucket" "default" {
  name     = "${var.app_name}-bucket"
  location = "US"
  project  = var.project_id
}

resource "google_compute_network" "default" {
  name    = "${var.app_name}-vpc"
  project = var.project_id
}

resource "google_service_account" "default" {
  account_id = "${var.app_name}-account"
  project    = var.project_id
}
