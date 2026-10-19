
module "my_remote_module" {
  source  = "terraform-at-scale/chapter-6/remote"
  version = "0.1.0"

  field1 = var.remote_field1
  field2 = var.remote_field2
  field3 = var.remote_field3
}
