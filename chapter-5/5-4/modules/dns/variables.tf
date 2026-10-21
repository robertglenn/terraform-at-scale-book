
variable "domain" {
  description = "Domain to create DNS zone"
  type        = string
}

variable "network" {
  description = "Network ID to attach DNS to"
  type        = string
}
