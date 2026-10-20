
variable "vm_configs" {
  description = "Configuration for VMs to provision"
  type = map(object({
    name         = string
    machine_type = string
    # ...
  }))
}
