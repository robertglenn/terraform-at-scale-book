
variable "eks_cluster" {
  description = "EKS cluster configuration variable"
  type = object({
    cluster_name   = string
    nodes_per_zone = number
  })

  validation {
    condition = (var.eks_cluster.nodes_per_zone > 1
    && var.eks_cluster.nodes_per_zone < 6)
    error_message = "nodes_per_zone must be between 2 and 5, inclusive"
  }
}
