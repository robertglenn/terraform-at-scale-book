
variable "network_name" {
  description = "Name of the VPC"
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
  description = "Zone in which the GCE instance will get created"
  type        = string
  default     = "us-central1-a"
}

variable "boot_image" {
  description = "Boot instance for the GCE instance"
  type        = string
  default     = "debian-cloud/debian-12"
}
