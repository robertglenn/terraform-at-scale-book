
variable "vm_inputs" {
  description = "List of VM data"
  type = map(object({
    name              = string
    has_attached_disk = bool
    has_second_nic    = bool
  }))
}
