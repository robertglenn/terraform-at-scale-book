
output "vpc_self_link" {
  value = google_compute_network.default.self_link
}

output "region_one_subnet_self_link" {
  value = google_compute_subnetwork.region_one.self_link
}

output "region_two_subnet_self_link" {
  value = google_compute_subnetwork.region_two.self_link
}

output "region_one_compute_self_link" {
  value = google_compute_instance.region_one.self_link
}

output "region_two_compute_self_link" {
  value = google_compute_instance.region_two.self_link
}

output "region_one_attached_disk_self_link" {
  value = google_compute_disk.region_one.self_link
}

output "region_two_attached_disk_self_link" {
  value = google_compute_disk.region_two.self_link
}

output "bucket_self_link" {
  value = google_storage_bucket.default.self_link
}
