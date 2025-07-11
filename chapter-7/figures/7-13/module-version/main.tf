
module "my-remote-module" {
    source  = "terraform-at-scale-book/figure-7-13/google"
    version = "0.1.0"

    field1  = var.remote_field1
    field2  = var.remote_field2
    field3  = var.remote_field3
}
