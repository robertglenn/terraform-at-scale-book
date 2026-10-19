
variable "config_map" {
  description = "Map of configurations for the firewall rules"
  type = map(object({
    firewall_name = string
    network_name  = string
  }))
}

variable "port_data" {
  description = "List of port data"
  type = list(object({
    protocol = string
    port     = string
  }))
}
