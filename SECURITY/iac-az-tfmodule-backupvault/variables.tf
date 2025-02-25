variable "resource_group_name" {
  type        = string
  description = "(Required) Resource Group Name"
}
variable "location" {
  type        = string
  description = "(Required) Resource Group Location"
}
variable "backupvaultname" {
  type        = string
  description = "(Required) Specifies the name of the Backup Vault"
}
variable "datastoretype" {
  type        = string
  description = "(Required) Specifies the type of the data store. Possible values are ArchiveStore, OperationalStore, SnapshotStore and VaultStore"
}
variable "redundancy" {
  type        = string
  description = "(Required) Specifies the backup storage redundancy. Possible values are GeoRedundant, LocallyRedundant and ZoneRedundant"
}
variable "retention_duration_in_days" {
  type        = number
  description = "(Optional) The soft delete retention duration for this Backup Vault. Possible values are between 14 and 180"
}
variable "identitytype" {
  type        = string
  description = "(Required) Type of the Identity assigned. Possible values are 'SystemAssigned' and 'UserAssigned'"
}
variable "tags" {
  type = map(string)
}