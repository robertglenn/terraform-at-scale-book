
output "subnets_map" {
  description = "Map of subnet IDs to subnet data"
  value = { for snet in google_compute_subnetwork.snet : snet.id => {
    region    = snet.region
    range     = snet.ip_cidr_range
    self_link = snet.self_link
  } }
}
