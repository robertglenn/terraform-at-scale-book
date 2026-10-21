
output "compute_ips" {
  description = "Map of IP addresses of the compute instances"
  value = { for vm in google_compute_instance.default
  : vm.network_interface.subnetwork => vm.network_interface.0.network_ip }
}
