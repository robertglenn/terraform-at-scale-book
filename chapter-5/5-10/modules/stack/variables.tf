
variable "app_name" {
  description = "Code name of the app"
  type        = string
}

variable "project_id" {
  description = "GCP project for resources"
  type        = string
}

variable "os_image" {
  description = "OS image for the compute resources"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the compute resources"
  type        = string
  default     = "n2-standard-2"
}

variable "zone" {
  description = "Resource zone for the stack's resources"
  type        = string
  default     = "us-east4-a"
}

variable "trusted" {
  description = "Whether this stack is in the trusted or untrusted network"
  type        = bool
  default     = false
}
