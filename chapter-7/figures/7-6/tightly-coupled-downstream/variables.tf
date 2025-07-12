
variable "vpc_info" {
    description = "VPC information to define the subnets."
    type        = list(object({
        network_id  = string
        snet1       = object({
            subnet_name     = string
            subnet_cidr     = string
            subnet_region   = string
        })
        snet2       = object({
            subnet_name     = string
            subnet_cidr     = string
            subnet_region   = string
        })
        snet3       = object({
            subnet_name     = string
            subnet_cidr     = string
            subnet_region   = string
        })
    }))
}
