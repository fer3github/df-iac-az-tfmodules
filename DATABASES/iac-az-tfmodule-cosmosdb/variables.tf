variable "resource_group_name" {
  type        = string
  description = "The resource group name to be imported"
}

variable "prefix" {
  type        = string
  default     = "cosmos-db-autoscale"
  description = "Prefix of the resource name"
}

variable "cosmosdb_account_name" {
  type        = string
  default     = null
  description = "Cosmos db account name"
}

variable "cosmosdb_account_location" {
  type        = string
  default     = "eastus"
  description = "Cosmos db account location"
}

variable "cosmosdb_sqldb_name" {
  type        = string
  default     = "default-cosmosdb-sqldb"
  description = "value"
}

variable "max_throughput" {
  type        = number
  default     = 4000
  description = "Cosmos db database max throughput"
  validation {
    condition     = var.max_throughput >= 4000 && var.max_throughput <= 1000000
    error_message = "Cosmos db autoscale max throughput should be equal to or greater than 4000 and less than or equal to 1000000."
  }
  validation {
    condition     = var.max_throughput % 100 == 0
    error_message = "Cosmos db max throughput should be in increments of 100."
  }
}

variable "cosmosdb_kind" {
  type        = string
  description = "Cosmosdb kind"
}

variable "cosmosdb_offer_type" {
  type        = string
  description = "Cosmosdb offer type."
}

variable "coordinator_public_ip_access_enabled" {
  type = bool
}

variable "administrator_login_password" {
  description = "Contraseña del administrador del servidor SQL"
}

variable "tags" {}
