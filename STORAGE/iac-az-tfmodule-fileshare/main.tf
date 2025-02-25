# main.tf

# Create a Azure File Share
resource "azurerm_storage_share" "myfileshare" {
  name                 = var.name
  storage_account_name = var.st_name
  quota                = var.quota
  # tags                 = var.tags
}
