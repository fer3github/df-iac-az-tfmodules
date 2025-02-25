output "aks_api_url" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.host
}

output "aks_node_resource_group" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "aks_oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.aks.oidc_issuer_url
}

output "aks_identity_properties" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0]
}

output "law_id" {
  value = azurerm_log_analytics_workspace.law.id
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}
