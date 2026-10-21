
variable "data" {
  description = "Firewall data to create dedicated firewalls for regions, jumpboxes, and clusters"
  type = map(object({
    region   = string
    to_range = string
    from_ips = list(string)
  }))
}

variable "network" {
  description = "VPC where the subnets get created"
  type        = string
}

variable "tcp_ports" {
  description = "Ports to open in the firewalls"
  type        = list(string)
}
