
# Clean, single line of code; requires some familiarity
output "vm_boot_disk_sources_splat" {
  description = "VM boot disks accessed using splat"
  value = google_compute_instance.gce_vms[*].boot_disk.source
}

# Somewhat longer to write due to extra syntax; possibly more accessible
output "vm_boot_disk_sources_for" {
  description = "VM boot disks accessed using for/in"
  value = [
    for vm in google_compute_instance.gce_vms : vm.boot_disk.source
  ]
}
