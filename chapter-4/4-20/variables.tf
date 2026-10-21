
variable "firewall_configs" {
  description = "Configuration map for firewalls"
  type = map(object({
    firewall_name = name
    allow_configs = map(object({
      protocol = string
      ports    = list(string)
    }))
  }))
}
