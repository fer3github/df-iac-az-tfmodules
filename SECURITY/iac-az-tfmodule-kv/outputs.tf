output "key_vault" {
  value = azurerm_key_vault.key_vault
}

output "keyvault_id" {
  value = azurerm_key_vault.key_vault.id
}
