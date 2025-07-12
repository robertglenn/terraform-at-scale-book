
variable "project_id" {
    description = "The project ID"
    type        = string
}

variable "snet_configs" {
    description = "A list of subnet information."
    type        = list(object({
        name   = string
        cidr   = string
        region = string
    }))
}
