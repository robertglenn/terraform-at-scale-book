
output "tags" {
  description = "Network tags for the cluster node pool"
  value = { for pool in google_container_node_pool.node_pool
  : pool.network_config.subnetwork => pool.node_config.tags }
}
