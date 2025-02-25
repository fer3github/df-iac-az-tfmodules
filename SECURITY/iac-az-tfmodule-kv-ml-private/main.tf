resource "azurerm_key_vault" "key_vault" {
  name                     = var.kvname
  location                 = var.location
  resource_group_name      = var.resource_group_name
  tenant_id                = data.azurerm_subscription.current.tenant_id
  purge_protection_enabled = var.kv_purge_protection
  sku_name                 = var.sku_name

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = var.tags
}
