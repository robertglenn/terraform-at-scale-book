
variable "vm_override_map" {
  description = "value"
  type = map(object({
    vm_type      = string
    disk_size_gb = number
  }))
}
