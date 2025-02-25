resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  # is_hns_enabled           = var.is_hns_enabled
  # public_network_access_enabled = var.public_network_access_enabled
  tags = var.tags

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
}

resource "azurerm_storage_container" "default_container" {
  name                  = "default"
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = "container"
  depends_on            = [azurerm_storage_account.storage_account]
}
