resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = var.node_pool_name
    vm_size    = var.vm_size
    node_count = var.node_count
    vnet_subnet_id = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned" # O UserAssigned si lo necesitas
  }

  tags = var.tags
}