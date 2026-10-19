
resource "google_storage_bucket" "tas_2_1_set_gce" {
  name     = var.bucket_name
  location = var.location_with_default
}
