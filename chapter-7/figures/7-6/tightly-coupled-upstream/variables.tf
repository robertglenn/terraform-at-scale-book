
variable "vpc_names" {
    description = "List of VPC names."
    type        = list(string)
}

variable "fw_http_name" {
    description = "Base name for the firewall rule that allows HTTP and HTTPS"
    type        = string
}

variable "fw_icmp_name" {
    description = "Base name for the firewall rule that disallows ICMP protocol"
    type        = string
}
