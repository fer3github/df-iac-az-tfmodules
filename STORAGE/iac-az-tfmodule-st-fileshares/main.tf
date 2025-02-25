resource "azurerm_storage_account" "storage_account" {
  name                             = var.storage_account_name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  account_tier                     = var.storage_account_tier
  account_replication_type         = var.storage_account_replication_type
  is_hns_enabled                   = var.is_hns_enabled
  public_network_access_enabled    = var.public_network_access_enabled
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  allow_nested_items_to_be_public  = var.allow_nested_items_to_be_public

  tags = var.tags
}




