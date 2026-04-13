
locals {
  micro_check = (contains(["us-west-1"], data.aws_region.region.region)
  && contains(["t3.micro"], var.instance_type))
  small_check = (contains(["us-east-1"], data.aws_region.region.region)
  && contains(["t3.small"], var.instance_type))
  ami_expires    = aws_ami.example.deprecation_time
  type_valid     = local.micro_check || local.small_check
  ami_valid      = timecmp(local.ami_expires, timestamp()) > 0
  instance_check = local.ami_valid && local.type_valid
  type_error     = "Only t3.micro (us-west-1) or t3.small (us-east-1)."
  ami_error      = "AMI must not be deprecated."
  error_message  = "${local.type_error} ${local.ami_error}"
}
