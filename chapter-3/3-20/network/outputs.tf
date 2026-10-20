
output "vpc_name" {
  description = "Name of the VPC created by the module"
  value       = google_compute_network.vpc.name
}

output "subnets" {
  description = "Information for the subnets created by the module"
  value = [for snet in google_compute_subnetwork.snets : {
    region = snet.region
  }]
}
