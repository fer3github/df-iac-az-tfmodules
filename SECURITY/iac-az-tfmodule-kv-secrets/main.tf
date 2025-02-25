resource "azurerm_key_vault_secret" "kv_secrets" {
  for_each     = { for idx, secret in var.secret_list : secret.secretname => secret }
  name         = each.value.secretname
  value        = each.value.secretvalue
  key_vault_id = var.keyvault_id
  tags         = var.tags
}