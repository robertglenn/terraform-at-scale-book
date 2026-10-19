
resource "aws_instance" "special_ec2_instance" {
  ami           = var.special_ec2_info.ami
  instance_type = var.special_ec2_info.instance_type
  subnet_id     = var.special_ec2_info.subnet_id
  tags          = var.special_ec2_info.tags
  #...

  cpu_options {
    core_count       = var.special_ec2_info.core_count
    threads_per_core = var.special_ec2_info.threads_per_core
  }
  # ...
}
