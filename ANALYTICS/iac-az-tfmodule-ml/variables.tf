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

variable "ml_enable_aml_computecluster" {
  description = "Variable to enable or disable AML compute cluster"
  default     = false
}

variable "ml_compute_cluster_name" {
  type = string
}

variable "ml_compute_cluster_vm_priority" {
  type = string
}

variable "ml_compute_cluster_vm_size" {
  type = string
}

variable "ml_batch_cluster_vm_size" {
  type = string
}

######### ACR Settings #########
variable "container_registry_id" {}