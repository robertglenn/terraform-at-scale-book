
module "server_iam_identities" {
  source = "./modules/iam_identities"

  project_id    = var.compute_project_id
  identity_data = var.server_identity_data
}

module "cluster_iam_identities" {
  source = "./modules/iam_identities"

  project_id    = var.compute_project_id
  identity_data = var.cluster_identity_data
}
