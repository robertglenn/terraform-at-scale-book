
variable "special_ec2_info" {
  description = "All the information necessary for the special instance."
  type = object({
    ami              = string
    instance_type    = string
    subnet_id        = string
    core_count       = number
    threads_per_core = number
    tags             = map(string)
    # ...
  })
}
