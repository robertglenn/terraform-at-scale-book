
resource "google_storage_bucket" "simplest" {
  name     = "simplest-bucket-configuration"
  location = "US"
}

resource "google_storage_bucket" "referencing" {
  name     = "referencing-bucket-configuration"
  location = "US"
  logging {
    log_bucket = google_storage_bucket.simplest.name
  }
}
