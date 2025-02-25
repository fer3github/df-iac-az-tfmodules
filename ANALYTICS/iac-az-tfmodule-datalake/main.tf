resource "azurerm_storage_data_lake_gen2_filesystem" "datalake" {
  name               = var.datalakename
  storage_account_id = var.st_id
}
