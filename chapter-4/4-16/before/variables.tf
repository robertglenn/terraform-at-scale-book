
variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "instance_name" {
  description = "Name of the GCE instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the GCE instance"
  type        = string
  default     = "n2-standard-2"
}

variable "instance_zone" {
  description = "Resource zone for the GCE instance"
  type        = string
  default     = "us-central1-a"
}

variable "boot_image" {
  description = "Boot image for the GCE instance"
  type        = string
  default     = "debian-cloud/debian-12"
}
