
variable "snet_configs" {
    description = "A list of subnet information."
    type        = object({
        name   = string
        cidr   = string
        region = string
    })
}
