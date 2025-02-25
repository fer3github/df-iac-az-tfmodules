variable "resource_group_name" {
  type        = string
  description = "(Required) Resource Group Name"
}
variable "location" {
  type        = string
  description = "(Required) Resource Group Location"
}
variable "containerappenvname" {
  type        = string
  description = "(Required) Name of the Container App Environment"
}
variable "log_analytics_workspace_id" {
  type        = string
  description = "(Required) ID of the Log Analytics Workspace"
}
variable "infrastructure_subnet_id" {
  type        = string
  description = "(Required) The existing Subnet to use for the Container Apps Control Plane."
}
variable "infrastructure_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group name of the Infrastructure rg"
}
variable "workload_profile" {
  default = null
}
variable "tags" {
  type = map(string)
}