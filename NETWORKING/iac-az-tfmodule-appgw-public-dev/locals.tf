# locals { #Queremos que si la ipconfiguration es publica, le venga el id de la pip de una variable, en lugar de del tfvars

#    publicipid = var.public_ip_id["${var.public_ip_name}"]["publicip_id"]

#    frontend_ip_configuration = [
#     for config in var.appgw_config.frontend_ip_configurations : 
#     config.name == "appGwPublicFrontendIpIPv4" ? merge(config, {public_ip_address_id = local.publicipid}) : config
#    ]

# }
