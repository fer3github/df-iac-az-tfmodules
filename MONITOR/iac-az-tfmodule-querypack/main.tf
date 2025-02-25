resource "azurerm_log_analytics_query_pack" "example" {
  name                = "mahouaksquerypack"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}

resource "azurerm_log_analytics_query_pack_query" "example" {
  query_pack_id = azurerm_log_analytics_query_pack.example.id
  body          = "KubePodInventory\n| where Namespace == 'gitops'\n| where ServiceName startswith 'frontend'"
  display_name  = "Exceptions - New in the last 24 hours"

  tags = var.tags
}
