
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 7.4.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = ">= 6.14.0"
    }
  }
}

provider "google" {
  project = "same-project-id"
  region  = "us-west2"
}

provider "aws" {
  region  = "us-west-2"
}
