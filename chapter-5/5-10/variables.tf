
variable "app_name" {
  description = "Code name of the app"
  type        = string
}

variable "app_trust_project" {
  description = "GCP project for the trust network resources"
  type        = string
}

variable "app_untrust_project" {
  description = "GCP project for the untrust network resources"
  type        = string
}

variable "os_image" {
  description = "OS image for the compute resources"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}
