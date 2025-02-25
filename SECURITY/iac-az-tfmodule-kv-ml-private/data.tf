data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}
#data "azurerm_user_assigned_identity" "mid1" {
#name                = "identity1"
#resource_group_name = var.managed_identity_rg_name
#}

#data "azurerm_user_assigned_identity" "mid2" {
#name                = "identity2"
#resource_group_name = var.managed_identity_rg_name
#}
