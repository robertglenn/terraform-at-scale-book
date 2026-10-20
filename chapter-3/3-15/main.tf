
locals {
  vm_config_default = { "vm_type" : "n1-standard-1", "disk_size_gb" : 20 }
  vm_config_final   = merge(local.vm_config_default, var.vm_override_map)
}
