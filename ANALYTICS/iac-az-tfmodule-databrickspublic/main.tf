resource "azurerm_databricks_workspace" "example" {
  name                          = var.databricksname
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.skuname
  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}
