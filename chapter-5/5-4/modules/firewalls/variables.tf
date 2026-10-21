
variable "network" {
  description = "Network ID to attach firewalls to"
  type        = string
}

variable "ranges" {
  description = "Ranges to create firewalls for"
  type        = list(string)
}
