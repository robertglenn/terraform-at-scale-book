
# -------------------------
# Networks
# -------------------------
resource "google_compute_network" "main" {
  name                    = "main-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "app" {
  name          = "app-subnet"
  region        = var.region
  network       = google_compute_network.main.id
  ip_cidr_range = var.subnet_cidr
}

# Serverless VPC Access Connector for App Engine -> SQL
resource "google_vpc_access_connector" "serverless" {
  name          = "app-serverless-conn"
  region        = var.region
  network       = google_compute_network.main.name
  ip_cidr_range = var.serverless_cidr
}

# -------------------------
# App Engine
# -------------------------
resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.app_engine_region
}

# -------------------------
# Cloud SQL
# -------------------------
resource "google_sql_database_instance" "main" {
  name             = "main-db"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = "db-custom-1-3840"

    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.main.id
    }
  }
}

resource "google_sql_database" "app" {
  name     = var.db_name
  instance = google_sql_database_instance.main.name
}

resource "google_sql_user" "app" {
  name     = var.db_user
  instance = google_sql_database_instance.main.name
  password = var.db_password
}

# -------------------------
# Cloud Storage
# -------------------------
# Static content bucket
resource "google_storage_bucket" "static" {
  name                        = "${var.project_id}-static"
  location                    = var.region
  uniform_bucket_level_access = true
}

# -------------------------
# IAM
# -------------------------
# App Engine permissions
resource "google_project_iam_member" "app_sql" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.app_engine.email}"
}

resource "google_project_iam_member" "app_storage" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.app_engine.email}"
}

resource "google_service_account" "app_engine" {
  account_id   = "app-engine-sa"
  display_name = "App Engine Service Account"
}
