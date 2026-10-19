
resource "aws_s3_bucket" "conditional_s3_bucket" {
  count = var.conditional_control_variable_s3

  bucket = "conditional-s3-bucket-example"
}

resource "aws_instance" "conditional_ec2_instance" {
  count = var.conditional_name_variable_ec2 == "" ? 0 : 1

  ami           = var.default_ami
  instance_type = "t2.micro"

  tags = {
    Name = var.conditional_name_variable_ec2
  }
}
