
locals {
  vpc_name                = "tas-11-vpc"
  location                = upper(split("-", local.region_one)[0])
  bucket_name             = "tas-11-bucket"
  developer_group         = "group:${var.developer_group_email}"
  region_one              = data.google_compute_zones.region_one.id
  zone_one                = data.google_compute_zones.region_one.names[0]
  region_one_disk_name    = "tas-11-${local.region_one}-disk"
  region_one_compute_name = "tas-11-${local.region_one}-comp"
  region_two              = data.google_compute_zones.region_two.id
  zone_two                = data.google_compute_zones.region_two.names[0]
  region_two_disk_name    = "tas-11-${local.region_two}-disk"
  region_two_compute_name = "tas-11-${local.region_two}-comp"
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
