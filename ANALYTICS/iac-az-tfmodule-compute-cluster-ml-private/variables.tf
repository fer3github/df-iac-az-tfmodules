######### General settings #########

variable "resource_group_name" {
  type        = string
  description = "(Required) Resource Group Name"
}

variable "location" {
  type        = string
  description = "(Required) Resource Group Location"
}

variable "subnet_id" {}
variable "ml_workspace_id" {}
######### ST Settings #########
variable "storage_account_id" {
  type        = string
  description = "(Required) Storage Account Id"
}

######### ML Settings #########

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

variable "image_build_compute_name" {

}
