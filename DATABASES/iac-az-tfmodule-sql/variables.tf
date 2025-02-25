variable "sql_server_name" {
  description = "Nombre del servidor SQL"
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos de Azure"
}

variable "location" {
  description = "Ubicación del servidor SQL"
}

variable "administrator_login" {
  description = "Nombre de usuario del administrador del servidor SQL"
}

variable "administrator_login_password" {
  description = "Contraseña del administrador del servidor SQL"
}

variable "sql_database_name" {
  description = "Nombre de la base de datos SQL"
}

variable "sql_server_version" {
  type        = string
  description = "Version del server"
}

variable "sql_database_edition" {
  type        = string
  description = "Edicion de la base de datos"
}

variable "sql_database_collation" {
  type        = string
  description = "Nombre de la collation"
}