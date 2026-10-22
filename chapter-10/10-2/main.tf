
data "aws_region" "region" {
  region = var.instance_region
}

locals {
  micro_check = (contains(["us-west-1"], data.aws_region.region.region)
  && contains(["t3.micro"], var.instance_type))
  small_check = (contains(["us-east-1"], data.aws_region.region.region)
  && contains(["t3.small"], var.instance_type))
  instance_check = local.micro_check || local.small_check
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = var.instance_type
  region        = data.aws_region.region.region

  lifecycle {
    precondition {
      condition     = local.instance_check
      error_message = "Only t3.micro (us-west-1) or t3.small (us-east-1) are allowed."
    }
  }
}
