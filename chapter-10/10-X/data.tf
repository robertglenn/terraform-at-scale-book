
data "google_compute_regions" "available" {
  status = "UP"
}

data "google_compute_zones" "available" {
  region = var.snet_region
  status = "UP"

  lifecycle {
    precondition {
      condition     = contains(data.google_compute_regions.available.names, var.snet_region)
      error_message = "Specified region is not available."
    }
  }
}
