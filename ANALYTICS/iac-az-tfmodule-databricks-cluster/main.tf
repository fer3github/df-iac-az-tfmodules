resource "databricks_cluster" "cluster" {
  cluster_name            = var.cluster_name
  node_type_id            = var.cluster_node_type_id
  spark_version           = data.databricks_spark_version.latest_lts.id
  autotermination_minutes = var.cluster_autotermination_minutes
  num_workers             = var.cluster_num_workers
  data_security_mode      = var.cluster_data_security_mode
}
