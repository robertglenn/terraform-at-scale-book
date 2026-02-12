
module "local" {
  source = "./modules/local"
  ...
}

module "public_registry" {
  source = "hashicorp/vault/aws"
  ...
}

module "private_registry" {
  source = "app.terraform.io/tas/private_module/aws"
  ...
}

module "private_registry_version" {
  source  = "app.terraform.io/tas/private_module/aws"
  version = ">= v1.0.1-alpha, < v1.2.0"
  ...
}

module "git_repository" {
  source = "git::ssh://mydomain.com/git/private_module"
  ...
}

module "git_repository_version" {
  source = "git::ssh://mydomain.com/git/private_module?ref=v1.0.1-rc.1"
  ...
}

module "git_repository_nested_version" {
  source = "git::ssh://mydomain.com/git/private_module//modules/nested"
  ...
}

module "bucket_zip" {
  source = "s3::https://s3.amazonaws.com/tas/c5/module.zip"
  ...
}

module "bucket_zip_nested" {
  source = "s3::https://s3.amazonaws.com/tas/c5/module.zip//modules/nested"
  ...
}
