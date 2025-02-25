resource "azurerm_postgresql_flexible_server" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  source_server_id    = var.server_source_id
}
