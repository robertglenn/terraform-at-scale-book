
output "subnet_names" {
  description = "Names of the subnets created by the module"
  value       = google_compute_subnetwork.snets[*].name
}
