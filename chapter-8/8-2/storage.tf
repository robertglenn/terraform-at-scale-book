
resource "google_storage_bucket" "static" {
  name                        = "${var.project_id}-static"
  location                    = var.region
  uniform_bucket_level_access = true
}
