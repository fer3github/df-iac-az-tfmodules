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


