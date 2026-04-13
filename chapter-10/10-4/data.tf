data "aws_region" "region" {
  region = var.region
}

data "aws_availability_zones" "available" {
  state  = "available"
  region = data.aws_region.region.region
}
