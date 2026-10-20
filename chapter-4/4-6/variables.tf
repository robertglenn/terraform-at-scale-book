
variable "vpc_name" {
  description = "Name of the vpc"
  type        = string
}

variable "ports" {
  description = "Ports to create firewalls for"
  type        = list(string)
}
