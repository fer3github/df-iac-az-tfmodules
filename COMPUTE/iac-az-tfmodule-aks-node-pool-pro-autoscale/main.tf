resource "azurerm_kubernetes_cluster_node_pool" "example" {
  name                  = var.name
  kubernetes_cluster_id = var.aks_id
  vm_size               = var.vm_size
  vnet_subnet_id        = var.vnet_subnet_id
  auto_scaling_enabled  = var.enable_auto_scaling
  min_count             = var.min_count
  max_count             = var.max_count
  mode                  = var.mode
  # temporary_name_for_rotation = "pool${random_string.example.result}"
  # type                        = var.type
  upgrade_settings {
    max_surge = var.max_surge
  }
  tags = var.tags
}

# resource "random_string" "example" {
#   length  = 6
#   special = false
#   upper   = false
#   numeric = false
#   lower   = true
# }
