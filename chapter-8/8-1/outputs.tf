
output "static_bucket" {
  description = "Name of the static website's bucket"
  value       = google_storage_bucket.static.name
}

output "cloudsql_connection" {
  description = "Cloud SQL connection name"
  value       = google_sql_database_instance.main.connection_name
}

output "app_engine_sa" {
  description = "App engine service account email"
  value       = google_service_account.app_engine.email
}
