
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
