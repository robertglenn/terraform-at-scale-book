
resource "google_project_iam_member" "app_sql" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.app_engine.email}"
}

resource "google_project_iam_member" "app_storage" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.app_engine.email}"
}

resource "google_service_account" "app_engine" {
  account_id   = "app-engine-sa"
  display_name = "App Engine Service Account"
}
