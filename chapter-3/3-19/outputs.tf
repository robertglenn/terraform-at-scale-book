
output "vms_count" {
  description = "Count of vms created by this module"
  value       = length(google_compute_instance.vms_list)
}
