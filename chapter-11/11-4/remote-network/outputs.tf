
output "vpc_self_link" {
  value = google_compute_network.default.self_link
}

output "region_one_subnet_self_link" {
  value = google_compute_subnetwork.region_one.self_link
}

output "region_two_subnet_self_link" {
  value = google_compute_subnetwork.region_two.self_link
}
