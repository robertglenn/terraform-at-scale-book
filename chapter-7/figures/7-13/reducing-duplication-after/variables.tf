
variable "snet_configs" {
    description = "A list of subnet information."
    type        = list(object({
        name   = string
        cidr   = string
        region = string
    }))
}
