
module "my-remote-module" {
    source  = "terraform-at-scale-book/figure-7-13/google"

    field1  = var.remote_field1
    field2  = var.remote_field2
    field3  = var.remote_field3
}
