project_id = "terraform-at-scale-book"
snet_configs = [
    {
        name   = "snet-01-terraform-at-scale-7-5"
        cidr   = "10.0.0.0/24"
        region = "us-west1"
    },
    {
        name   = "snet-02-terraform-at-scale-7-5"
        cidr   = "10.0.1.0/24"
        region = "us-central1"
    },
    {
        name   = "snet-03-terraform-at-scale-7-5"
        cidr   = "10.0.2.0/24"
        region = "us-east1"
    }
]
