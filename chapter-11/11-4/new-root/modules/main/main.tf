
locals {
  location        = upper(split("-", local.region_one)[0])
  developer_group = "group:${var.developer_group_email}"
  region_one      = data.google_compute_zones.region_one.id
  region_two      = data.google_compute_zones.region_two.id
}

resource "google_storage_bucket" "default" {
  name     = var.bucket_name
  project  = var.project_id
  location = var.location
}

resource "google_storage_bucket_iam_member" "bucket_admin" {
  bucket = google_storage_bucket.default.name
  role   = "roles/storage.admin"
  member = local.developer_group
}

resource "google_project_iam_member" "compute_admin" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = local.developer_group
}
