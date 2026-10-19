
module "app_1_dev" {
  source = "./modules/stack"

  app_name   = var.app_1_name
  project_id = var.app_1_dev_project
}

module "app_1_prod" {
  source = "./modules/stack"

  app_name   = var.app_1_name
  project_id = var.app_1_prod_project
}

module "app_2_dev" {
  source = "./modules/stack"

  app_name   = var.app_2_name
  project_id = var.app_2_dev_project
}

module "app_2_prod" {
  source = "./modules/stack"

  app_name   = var.app_2_name
  project_id = var.app_2_prod_project
}

# -------------------------
# Grouping storage, network, and service account definitions

resource "google_storage_bucket" "default" {
  name     = "${var.app_name}-bucket"
  location = "US"
}

resource "google_compute_network" "default" {
  name = "${var.app_name}-vpc"
}

resource "google_service_account" "default" {
  account_id = "${var.app_name}-account"
}
