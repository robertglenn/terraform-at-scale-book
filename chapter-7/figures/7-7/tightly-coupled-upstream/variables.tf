
variable "fw_allow_http_name" {
    description = "Name for the firewall rule that allows HTTP and HTTPS"
    type        = string
}

variable "fw_deny_icmp_name" {
    description = "Name for the firewall rule that disallows ICMP protocol"
    type        = string
}
