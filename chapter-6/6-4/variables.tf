
variable "network_project_id_common" {
  description = "GCP project ID for network resources"
  type        = string
}

variable "network_mtu" {
  description = "MTU for the network resources"
  type        = number
}

variable "workload_name" {
  description = "App codename"
  type        = string
}

variable "allowed_ports" {
  description = "List of ports to allow in firewall rules"
  type        = list(string)
}

variable "subnet_count_optional" {
  description = "Number of Subnets (defaults to 2)"
  type        = number
  default     = 2
}

variable "subnet_logging_optional" {
  description = "Sets logging for subnets (defaults to true)"
  type        = bool
  default     = true
}
