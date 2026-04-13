
module "local" {
  source = "./modules/local"

  read_from_bucket = google_storage_bucket.example.time_created
  read_from_subnet = google_compute_subnetwork.example
}

resource "google_storage_bucket" "example" {
  name          = "example-bucket"
  location      = "US"
  force_destroy = module.local.pass_to_resource
}

resource "google_compute_subnetwork" "example" {
  name          = "example-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.example.id
}

resource "google_compute_network" "example" {
  name                    = "example-network"
  auto_create_subnetworks = module.local.pass_to_resource
}
