variable "aks_cluster_name" {
  type = string
  description = "Nombre del clúster AKS"
}

variable "location" {
  type = string
  description = "Ubicación de Azure"
}

variable "resource_group_name" {
  type = string
  description = "Nombre del grupo de recursos"
}

variable "dns_prefix" {
  type = string
  description = "Prefijo DNS para el clúster AKS"
}

variable "kubernetes_version" {
  type = string
  description = "Versión de Kubernetes"
}

variable "node_pool_name" {
  type = string
  description = "Nombre del pool de nodos"
}

variable "vm_size" {
  type = string
  description = "Tamaño de las máquinas virtuales para los nodos"
}

variable "node_count" {
  type = number
  description = "Número de nodos"
}

variable "vnet_subnet_id" {
  type = string
  description = "ID de la subred de la red virtual"
}

variable "tags" {
  type = map(string)
  description = "Etiquetas para los recursos"
  default = {}
}