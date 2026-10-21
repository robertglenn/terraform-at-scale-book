
variable "project_id" {
  description = "Project in which to provision resources"
  type        = string
}

variable "subnets_data" {
  description = "Subnets in which to provision compute instances"
  type        = map(string)
}

variable "service_account" {
  description = "Service account email to attach to compute instances"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the compute instance"
  type        = string
  default     = "n2-standard-2"
}
