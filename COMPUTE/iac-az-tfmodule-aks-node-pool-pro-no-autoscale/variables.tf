variable "name" {
  description = "Nombre del node pool"
}

variable "aks_id" {
  description = "Id del aks"
}

variable "vm_size" {
  description = "Tamaño de la vm"
}

variable "vnet_subnet_id" {}

variable "enable_auto_scaling" {}

variable "node_count" {
  type = number
}

variable "mode" {}

# variable "type" {}

variable "max_surge" {}

# variable "node_count" {
#   description = "Node count"
# }

variable "tags" {
  type = map(string)
}
