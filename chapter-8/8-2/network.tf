
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
