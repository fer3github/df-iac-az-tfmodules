# variables.tf

variable "resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos"
}

variable "redis_cache_name" {
  description = "Nombre del servicio Azure Cache for Redis"
}

variable "location" {
  type        = string
  description = "The Azure location to use"
  default     = "westeurope"
}

variable "redis_sku_name" {
  type        = string
  description = "The sku name to use"
}

variable "redis_family" {
  type        = string
  description = "The family to use"
}

variable "redis_capacity" {
  type        = string
  description = "The capacity to use"
}

variable "enable_non_ssl_port" {
  type = bool
}

variable "public_network_access_enabled" {
  type = bool
}

variable "minimum_tls_version" {
  type = string
}

variable "tags" {}

variable "data_persistence_authentication_method" {}
