resource "azurerm_kusto_cluster" "cluster" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  streaming_ingestion_enabled = true
  language_extensions         = ["PYTHON"]
  count                       = var.enable_monitoring ? 1 : 0

  sku {
    name     = var.sku
    capacity = 2
  }
  tags = var.tags
}

resource "azurerm_kusto_database" "database" {
  name                = var.kusto_database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = azurerm_kusto_cluster.cluster[0].name
  count               = var.enable_monitoring ? 1 : 0
}
