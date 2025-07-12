
terraform {
  backend "gcs" {
    bucket  = "terraform-at-scale-book"
    prefix  = "figures/7-5"
  }
}
