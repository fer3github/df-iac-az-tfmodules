resource "azurerm_storage_container" "my_container" {
  name                  = var.name
  storage_account_name    = var.st_name
  container_access_type = var.container_access_type
}