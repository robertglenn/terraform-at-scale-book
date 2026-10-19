
variable "aws_network_acl_list" {
  description = "Access Control List configurations"
  type        = list(map(string))

  validation {
    condition = (length(var.aws_network_acl_list) > 0 ?
      (var.aws_network_acl_list[0]["direction"] == "ingress"
      || var.aws_network_acl_list[0]["direction"] == "egress")
      && (var.aws_network_acl_list[0]["action"] == "allow"
      || var.aws_network_acl_list[0]["action"] == "deny")
    : true)
    error_message = join(" ", [
      "Each item in the aws_network_acl_list",
      "should have the 'direction' and 'action' keys"
    ])
  }
}
