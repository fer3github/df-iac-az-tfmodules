resource "azurerm_data_protection_backup_vault" "example" {
  name                       = var.backupvaultname
  resource_group_name        = var.resource_group_name
  location                   = var.location
  datastore_type             = var.datastoretype
  redundancy                 = var.redundancy
  retention_duration_in_days = var.retention_duration_in_days

  identity {
    type = var.identitytype
  }

  tags = var.tags
}