######### General settings #########

variable "resource_group_name" {
  type        = string
  description = "(Required) Resource Group Name"
}

variable "location" {
  type        = string
  description = "(Required) Resource Group Location"
}

variable "tags" {

}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

# variable "serverless_compute_public_ip_enabled" {}
# variable "isolation_mode" {}
# variable "subnet_id" {}
# variable "node_public_ip_enabled" {}
######### ST Settings #########
variable "storage_account_id" {
  type        = string
  description = "(Required) Storage Account Id"
}

variable "storage_account_name" {
  type        = string
  description = "(Required) Storage Account Name"
}
######### AI Settings #########
variable "application_insights_id" {
  type        = string
  description = "(Required) Application Insights Name"
}

######### KV Settings #########
variable "keyvault_id" {
  type        = string
  description = "(Required) KV Name"
}

######### ML Settings #########
variable "ml_name" {
  type        = string
  description = "(Required) Machine Learning Name"
}

variable "image_build_compute_name" {

}

######### ACR Settings #########
variable "container_registry_id" {}
