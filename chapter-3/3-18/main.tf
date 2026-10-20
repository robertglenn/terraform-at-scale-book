locals {
  regions_per_vpc = { for vpc in module.networks : vpc.name => vpc.regions }
  vpcs_by_region  = transpose(local.regions_per_vpc)
}
# regions_per_vpc:
# {
# "vpc-123": ["us-central1", "us-west1"],
# "vpc-456": ["us-central1", "us-east1"],
# "vpc-789": ["us-east1", "us-west1"]
# }
#
# vpcs_by_region:
# {
# "us-central1": ["vpc-123", "vpc-456"],
# "us-east1": ["vpc-456", "vpc-789"],
# "us-west1": ["vpc-123", "vpc-789"]
# }