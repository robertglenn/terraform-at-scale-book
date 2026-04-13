
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  region     = data.aws_region.region.region
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_network_interface" "example" {
  subnet_id = aws_subnet.my_subnet.id
}

resource "aws_ami" "example" {
  name             = var.ami_name
  region           = data.aws_region.region.region
  deprecation_time = var.ami_deprecated_on
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.example.id
  instance_type = var.instance_type
  region        = data.aws_region.region.region

  primary_network_interface {
    network_interface_id = aws_network_interface.example.id
  }

  lifecycle {
    precondition {
      condition     = local.instance_check
      error_message = local.error_message
    }
  }
}
