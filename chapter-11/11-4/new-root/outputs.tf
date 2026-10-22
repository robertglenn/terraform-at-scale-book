
output "vpc_self_link" {
  value = module.network.vpc_self_link
}

output "region_one_subnet_self_link" {
  value = module.network.region_one_subnet_self_link
}

output "region_two_subnet_self_link" {
  value = module.network.region_two_subnet_self_link
}

output "region_one_compute_self_link" {
  value = module.compute.region_one_compute_self_link
}

output "region_two_compute_self_link" {
  value = module.compute.region_two_compute_self_link
}

output "region_one_attached_disk_self_link" {
  value = module.compute.region_one_attached_disk_self_link
}

output "region_two_attached_disk_self_link" {
  value = module.compute.region_two_attached_disk_self_link
}

output "bucket_self_link" {
  value = module.local_main.bucket_self_link
}
