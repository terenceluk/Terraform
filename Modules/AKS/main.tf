/*
Deployment of Azure Kubernetes Cluster
Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster
*/
resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  # Optional configuration
  kubernetes_version = var.k8s_version

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_pool_count
    vm_size    = var.node_pool_vm_size
    max_count  = var.enable_auto_scaling ? var.node_pool_max_count : null
    min_count  = var.enable_auto_scaling ? var.node_pool_min_count : null
    # Optional configuration
    orchestrator_version = var.k8s_version
    type                 = var.k8s_type
    os_disk_size_gb      = var.node_pool_osdisk_size
    enable_auto_scaling  = var.enable_auto_scaling ? true : false
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      default_node_pool[1],
    ]
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
  }

  tags = {
    Environment = var.env
  }
}