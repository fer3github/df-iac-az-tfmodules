resource "azurerm_databricks_workspace" "example" {
  name                                  = var.databricksname
  resource_group_name                   = var.resource_group_name
  location                              = var.location
  sku                                   = var.skuname
  public_network_access_enabled         = var.public_network_access_enabled
  network_security_group_rules_required = try(var.network_security_group_rules_required, null)
  customer_managed_key_enabled          = var.customer_managed_key_enabled

  custom_parameters {
    no_public_ip                                         = var.custom_parameters.no_public_ip
    virtual_network_id                                   = var.custom_parameters.virtual_network_id
    private_subnet_name                                  = var.custom_parameters.private_subnet_name
    public_subnet_name                                   = var.custom_parameters.public_subnet_name
    public_subnet_network_security_group_association_id  = var.custom_parameters.public_subnet_network_security_group_association_id
    private_subnet_network_security_group_association_id = var.custom_parameters.private_subnet_network_security_group_association_id
    storage_account_name                                 = var.custom_parameters.storage_account_name
  }

  tags = var.tags
}
