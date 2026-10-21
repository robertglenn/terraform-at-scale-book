
variable "stack_data" {
  description = "Data for this resource stack"
  type = list(object({
    app_name = string
    region   = string
    zone     = string
  }))
}

variable "network_id" {
  description = "Network ID for the resources"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the GCE instances"
  type        = string
  default     = "n2-standard-2"
}

variable "os_image" {
  description = "OS image for the GCE instances"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}
