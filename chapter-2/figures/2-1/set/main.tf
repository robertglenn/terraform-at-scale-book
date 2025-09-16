
resource google_storage_bucket "tas-2-1-set-gce" {
  name          = var.bucket_name
  location      = var.location_with_default
}
