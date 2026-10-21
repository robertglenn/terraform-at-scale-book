
output "network" {
  description = "ID of the VPC network"
  value       = google_compute_network.default.id
}
output "ranges" {
  description = "Ranges that were used to create the subnets"
  value       = var.network_data.ranges
}