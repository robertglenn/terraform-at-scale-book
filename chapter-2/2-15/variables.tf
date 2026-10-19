
variable "ntwrk_info" {
  description = "Contains several configurations for a VPC"
  type = object({
    vpc_region = string
    acl_list   = list(map(string))
  })

  validation {
    condition = ((contains(["us-east-2", "us-west-2"], var.ntwrk_info.vpc_region))
      && (
        length(var.ntwrk_info.acl_list) > 0 ?
        (var.ntwrk_info.acl_list[0]["direction"] == "ingress"
        || var.ntwrk_info.acl_list[0]["direction"] == "egress")
        && (var.ntwrk_info.acl_list[0]["action"] == "allow"
        || var.ntwrk_info.acl_list[0]["action"] == "deny")
      : true)
    )
    error_message = join(" ", [
      "The region must be 'us-east-2' or 'us-west-2' and each item in the",
      "acl_list should have the 'direction' and 'action' keys"
    ])
  }
}
