
resource google_compute_network "gcp_vpc" {
  provider = google

  name = var.network_name
}

resource aws_vpc "aws_vpc" {
  provider = aws

  cidr_block = var.cidr_block

  tags = {
    Name = var.network_name
  }
}
