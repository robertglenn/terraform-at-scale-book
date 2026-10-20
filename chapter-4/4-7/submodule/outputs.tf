
output "special_instance_name" {
  description = "Name of the special GCE instance"
  value       = google_compute_instance.special_instance.name
}
