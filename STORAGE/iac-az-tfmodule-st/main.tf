resource "azurerm_storage_account" "storage_account" {
  name                          = var.storage_account_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = var.storage_account_tier
  account_replication_type      = var.storage_account_replication_type
  is_hns_enabled                = var.is_hns_enabled
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
}

resource "azurerm_storage_container" "default_container" {
  count                 = var.is_ml ? 1 : 0
  name                  = "default"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "container"
}




