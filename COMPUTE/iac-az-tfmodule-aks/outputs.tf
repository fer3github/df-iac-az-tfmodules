output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.config
  description = "Configuración de Kubernetes (kubeconfig)"
  sensitive = true # Marca kubeconfig como sensible
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
  description = "Nombre del clúster AKS"
}