
variable "name" {
  description = "Name of the compute instance and base of other names"
  type        = string
}

variable "machine_type" {
  description = "Machine image for the compute instance"
  type        = string
  default     = "n2-standard-8"
}

variable "zone" {
  description = "Resource zone to create resources in"
  type        = string
}

variable "os_image" {
  description = "RHEL OS image for compute instance"
  type        = string

  validation {
    condition     = strcontains(var.os_image, "rhel")
    error_message = "os_image must be a rhel image"
  }
}

variable "subnetworks" {
  description = "Subnetwork names for compute instance"
  type        = list(string)

  validation {
    condition     = length(var.subnetworks) > 0
    error_message = "subnetworks must not be empty."
  }
}

variable "disk_data" {
  description = "value"
  type = list(object({
    device_name = string
    size_bytes  = number
  }))
}
