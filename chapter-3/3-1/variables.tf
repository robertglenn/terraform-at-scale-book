
variable "http_firewall_name" {
  description = "Name of the HTTP firewall"
  type        = string
}

variable "vpc_network" {
  description = "VPC network ID to attach firewalls to"
  type        = string
}

variable "http_only" {
  description = "Whether or not to only provision HTTP firewall (default is false)"
  type        = bool
  default     = false
}

variable "https_firewall_name" {
  description = "Name of the HTTPS firewall"
  type        = string
}
