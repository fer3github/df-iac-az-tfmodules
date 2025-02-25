variable "aks_cluster_name" {
  description = "Nombre del clúster AKS"
}

variable "identity_type" {
  description = "user o system assigned"
  default     = "SystemAssigned"
}

variable "sku" {
  type = string
}

variable "location" {
  description = "Ubicación del clúster AKS"
}

variable "aks_oidc_issuer_enabled" {
  description = "Si queremos oidc issuer para usar con federeted credential y external-secret"
}

variable "kubernetes_version" {
  type        = string
  description = "version de kubernetes utilizada por el cluster"
}

variable "image_cleaner_interval_hours" {
  type = string
  default = "48"
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos de Azure"
}

variable "dns_prefix" {
  description = "Prefijo DNS del clúster AKS"
}

variable "node_pool_name" {
  description = "Nombre del grupo de nodos predeterminado"
}

variable "node_count" {
  type        = string
  description = "Número de nodos en el grupo de nodos predeterminado"
}

variable "min_count" {
  default = null
}

variable "max_count" {
  default = null
}

variable "auto_scaling" {
  description = "Configuración de autoscaling para el grupo de nodos predeterminado"
}

variable "identity_id" {
  type    = string
  default = ""
}

# variable "identity_principal_id" {
#   type = string
# }

variable "acr_id" {
  type        = string
  description = "ID Del acr con el que queremos hacer pull desde aks"
}

variable "kv_id" {
  type        = string
  description = "ID Del kv con el que queremos hacer pull desde aks"
}

# variable "redis_id"{
#   type = string
#   description = "ID Del kv con el que queremos hacer pull desde aks"
# }

variable "vm_size" {
  description = "Tamaño de las máquinas virtuales del grupo de nodos predeterminado"
}

variable "vnet_subnet_id" {
  description = "ID (Output) de la subnet"
  type        = string
}

variable "private_dns_zone_id" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}

variable "azure_policy_enabled" {
  type = bool
}

variable "http_enabled" {
  type = bool
}

variable "private_cluster_enabled" {
  type = bool
}

variable "law_name" {
  type = string
}

variable "law_sku" {
  type = string
}

variable "law_retention_days" {
  type = number
}

variable "lawelz" {
  type = string
}
