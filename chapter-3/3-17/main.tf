locals {
  vpc_names      = ["vpc-dev", "vpc-test", "vpc-prod"]
  subnet_regions = ["us-west1", "us-east1", "us-central1"]
  zones          = ["trust", "non-trust"]
  to_create      = setproduct(local.vpc_names, local.subnet_regions, local.zones)
}
# to_create produces the following:
# [
# ["vpc-dev", "us-west1", "trust"],
# ["vpc-dev", "us-west1", "non-trust"],
# ["vpc-dev", "us-east1", "trust"],
# ["vpc-dev", "us-east1", "non-trust"],
# ["vpc-dev", "us-central1", "trust"],
# ["vpc-dev", "us-central1", "non-trust"],
# ["vpc-test", "us-west1", "trust"],
# ["vpc-test", "us-west1", "non-trust"],
# ["vpc-test", "us-east1", "trust"],
# ["vpc-test", "us-east1", "non-trust"],
# ["vpc-test", "us-central1", "trust"],
# ["vpc-test", "us-central1", "non-trust"],
# ["vpc-prod", "us-west1", "trust"],
# ["vpc-prod", "us-west1", "non-trust"],
# ["vpc-prod", "us-east1", "trust"],
# ["vpc-prod", "us-east1", "non-trust"],
# ["vpc-prod", "us-central1", "trust"],
# ["vpc-prod", "us-central1", "non-trust"]
# ]
