
output "module_compute_data_name" {
  description = "Name of the module's compute instance"
  value       = google_compute_instance.module_compute.name
}

output "module_compute_data" {
  description = "Module's compute instance data, including name"
  value = {
    name = google_compute_instance.module_compute.name
  }
}
