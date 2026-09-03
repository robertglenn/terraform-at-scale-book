
terraform {
  backend "gcs" {
    bucket = "terraform-at-scale-book"
    prefix = "figures/6-5"
  }
}
