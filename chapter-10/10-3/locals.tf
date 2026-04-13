
locals {
  micro_check = (contains(["us-west-1"], data.aws_region.region.region)
  && contains(["t3.micro"], var.instance_type))
  small_check = (contains(["us-east-1"], data.aws_region.region.region)
  && contains(["t3.small"], var.instance_type))
  instance_check = local.micro_check || local.small_check
}
