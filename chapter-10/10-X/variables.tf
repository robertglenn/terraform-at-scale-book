
variable "snet_cidr" {
  type        = string
  description = "CIDR for the subnet."

  validation {
    condition     = local.cidr_check
    error_message = "Must be /20 and contained within 10.0.0.0/16"
  }
}

variable "snet_region" {
  type        = string
  description = "Region for the subnet."

  validation {
    condition     = local.region_check
    error_message = "Must be in US."
  }
}

variable "instance_zone" {
  type        = string
  description = "Zone for the instance."

  validation {
    condition     = local.zone_check
    error_message = "Must be within the specified snet_region and available."
  }
}

variable "machine_type" {
  type        = string
  description = "Machine type for the instance."

  validation {
    condition     = local.type_check
    error_message = "Only N2 standard machine types up to 48 CPU allowed."
  }
}

variable "boot_image" {
  type        = string
  description = "Boot disk image for the instance."
  default     = "debian-cloud/debian-12"

  validation {
    condition     = local.boot_check
    error_message = "Must be debian or ubuntu."
  }
}
