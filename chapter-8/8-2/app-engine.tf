
resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.app_engine_region
}
