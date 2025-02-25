#Required Variables
variable "serviceaccount_name" {
  type        = string
  description = "Service account to link with Azure AD"
}

variable "resource_group_name" {
  type        = string
  description = "resource_group"
}

variable "aks_oidc_issuer_url" {
  type        = string
  description = "la uri del cluster"

}
variable "namespace" {
  type        = string
  description = "namespace donde esta el service account"

}

variable "managed_identity_id" {
  type        = string
  description = "el id de la managed identity que crea aks para los nodepools"
}