
resource "google_storage_bucket" "simplest" {
  name     = "simple-bucket"
  location = "US"
}

resource "google_storage_bucket" "multiple_buckets" {
  for_each = var.multiple_buckets_config

  name     = each.value.name
  location = each.value.location
}
