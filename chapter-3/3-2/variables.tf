
variable "vm_instance" {
  description = "Configuration for VM instances"
  type = list(object({
    name         = string
    machine_type = string
  }))
}
