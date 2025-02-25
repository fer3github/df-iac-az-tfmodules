# resource "azurerm_cosmosdb_account" "cosmosdb_account" {
#   name                      = var.cosmosdb_account_name
#   location                  = var.cosmosdb_account_location
#   resource_group_name       = var.resource_group_name
#   offer_type                = var.cosmosdb_offer_type
#   kind                      = var.cosmosdb_kind
#   enable_automatic_failover = false
#   geo_location {
#     location          = var.cosmosdb_account_location
#     failover_priority = 0
#   }
#   consistency_policy {
#     consistency_level       = "BoundedStaleness"
#     max_interval_in_seconds = 300
#     max_staleness_prefix    = 100000
#   }
# }

resource "azurerm_cosmosdb_postgresql_cluster" "example" {
  name                                 = var.cosmosdb_sqldb_name
  resource_group_name                  = var.resource_group_name
  location                             = var.cosmosdb_account_location
  administrator_login_password         = var.administrator_login_password
  coordinator_public_ip_access_enabled = var.coordinator_public_ip_access_enabled
  coordinator_storage_quota_in_mb      = 131072
  coordinator_vcore_count              = 2
  node_count                           = 0

  tags = var.tags
}

# resource "random_pet" "prefix" {
#   prefix = var.prefix
#   length = 1
# }