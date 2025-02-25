output "id" {
  value = azurerm_storage_account.storage_account.id
}

output "name" {
  value = azurerm_storage_account.storage_account.name
}

output "connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
}