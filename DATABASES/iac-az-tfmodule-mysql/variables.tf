variable "resource_group_name" {
  description = "Nombre del grupo de recursos de Azure"
}

variable "location" {
  description = "Ubicación del servidor SQL"
}

variable "configuration" {
  description = "Nombre de usuario del administrador del servidor MYSQL"
}

variable "administrator_login_password" {
  description = "Contraseña del administrador del servidor SQL"
}

variable "tags" {}

# variable "aks_subnet_id"{
#   type = string
# }

# variable "aks_vnet_id" {
#   type = string
# }
# #Para que creemos una zona dns para el pe
# variable "dns_name" {
#   type = string
# }

