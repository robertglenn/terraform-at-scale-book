
output "static_bucket" {
  value = google_storage_bucket.static.name
}

output "cloudsql_connection" {
  value = google_sql_database_instance.main.connection_name
}

output "app_engine_sa" {
  value = google_service_account.app_engine.email
}
