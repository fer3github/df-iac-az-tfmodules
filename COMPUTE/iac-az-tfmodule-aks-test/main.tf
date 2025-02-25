resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.law_sku
  retention_in_days   = var.law_retention_days

  tags = var.tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                             = var.aks_cluster_name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  dns_prefix                       = var.dns_prefix
  azure_policy_enabled             = var.azure_policy_enabled
  http_application_routing_enabled = var.http_enabled
  sku_tier                         = var.sku
  private_dns_zone_id              = var.private_dns_zone_id != null ? var.private_dns_zone_id : null
  private_cluster_enabled          = var.private_cluster_enabled
  oidc_issuer_enabled              = var.aks_oidc_issuer_enabled
  kubernetes_version               = var.kubernetes_version
  image_cleaner_interval_hours     = var.image_cleaner_interval_hours
  default_node_pool {
    name                        = var.node_pool_name
    vm_size                     = var.vm_size
    vnet_subnet_id              = var.vnet_subnet_id
    auto_scaling_enabled        = var.auto_scaling
    min_count                   = var.min_count
    max_count                   = var.max_count
    node_count                  = var.node_count
    temporary_name_for_rotation = "pool${random_string.example.result}"
    type                        = "VirtualMachineScaleSets"
    upgrade_settings {
      max_surge                = "10%"
      drain_timeout_in_minutes = 30
    }
  }

  identity {
    type         = var.identity_type
    identity_ids = var.identity_type != "SystemAssigned" ? [var.identity_id] : null
  }

  oms_agent {
    log_analytics_workspace_id      = azurerm_log_analytics_workspace.law.id
    msi_auth_for_monitoring_enabled = true
  }

  tags = var.tags
}

# Esto linkea nuestro aks con un ACR
resource "azurerm_role_assignment" "kubweb_to_acr" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  #Igual que en DEV usamos directamente el id de la identidad noseque-agentpool creada por aks.
}

# Esto linkea nuestro aks con un keyvault
resource "azurerm_role_assignment" "kubweb_to_kv" {
  scope                = var.kv_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

# resource "azurerm_role_assignment" "kubweb_to_redis" {
#   scope                = var.redis_id
#   role_definition_name = "Redis Cache Contributor"
#   principal_id         = 
# }

resource "random_string" "example" {
  length  = 6
  special = false
  upper   = false
  numeric = false
  lower   = true
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name                       = "setbypolicy"
  target_resource_id         = azurerm_kubernetes_cluster.aks.id
  log_analytics_workspace_id = var.lawelz

  enabled_log {
    category = "kube-apiserver"
  }

  enabled_log {
    category = "kube-controller-manager"
  }

  enabled_log {
    category = "kube-scheduler"
  }

  enabled_log {
    category = "cluster-autoscaler"
  }

  enabled_log {
    category = "guard"
  }

  enabled_log {
    category = "cloud-controller-manager"
  }
}
