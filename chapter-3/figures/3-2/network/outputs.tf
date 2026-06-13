
output "subnet_names" {
  value = google_compute_subnetwork.snets[*].name
}
