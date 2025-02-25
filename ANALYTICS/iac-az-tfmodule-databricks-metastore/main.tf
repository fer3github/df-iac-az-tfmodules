
resource "databricks_metastore" "metastore" {
  name   = var.metastore_name
  region = var.metastore_region
}

resource "databricks_metastore_assignment" "metastore_assignment" {
  metastore_id = databricks_metastore.metastore.id
  workspace_id = tonumber(regex("adb-(\\d+)\\.", var.workspace_url)[0])
}
