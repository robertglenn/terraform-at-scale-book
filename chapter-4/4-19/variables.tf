
variable "vm_name" {
  description = "value"
  type        = string
}

variable "vm_type" {
  description = "value"
  type        = string
}

variable "disk_configs" {
  description = "value"
  type = map(object({
    disk_name   = string
    device_name = string
  }))
}

variable "nic_configs" {
  description = "value"
  type = map(object({
    subnet_name   = string
    public_access = string
  }))
}
