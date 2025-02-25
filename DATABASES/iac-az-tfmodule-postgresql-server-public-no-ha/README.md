Inputs 
Para el servidor
"resource_group_name" 
"location" 

Para servidor y database
"tags" {}
"configuration" {
    sql_server_name        = string
    sql_server_version     = string
    sql_admin_login        = string
    sql_database_name      = string
    sql_database_collation = string
    sql_database_edition   = string
}

Para la base de datos
"administrator_login_password" 
