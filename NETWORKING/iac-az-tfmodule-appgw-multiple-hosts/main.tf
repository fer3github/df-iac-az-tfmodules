resource "azurerm_application_gateway" "network" {
  name                              = var.appgw_config.appgwname
  resource_group_name               = var.resource_group_name
  location                          = var.location
  zones                             = var.appgw_config.zones
  enable_http2                      = var.appgw_config.enable_http2
  fips_enabled                      = var.appgw_config.fips_enabled
  force_firewall_policy_association = var.appgw_config.force_firewall_policy_association

  sku {
    name     = var.appgw_config.sku.sku_name
    tier     = var.appgw_config.sku.sku_tier
    capacity = var.appgw_config.sku.sku_capacity
  }

  ssl_policy {
    min_protocol_version = var.appgw_config.ssl_policy.min_protocol_version
    policy_type          = var.appgw_config.ssl_policy.policy_type
    cipher_suites        = var.appgw_config.ssl_policy.cipher_suites
  }

  autoscale_configuration {
    min_capacity = 0
    max_capacity = 10
  }

  dynamic "frontend_port" {
    for_each = var.appgw_config.frontend_ports
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }

  dynamic "gateway_ip_configuration" {
    for_each = var.appgw_config.gateway_ip_configurations
    content {
      name      = gateway_ip_configuration.value.name
      subnet_id = gateway_ip_configuration.value.subnet_id
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.appgw_config.frontend_ip_configurations
    content {
      name                          = frontend_ip_configuration.value.name
      public_ip_address_id          = try(frontend_ip_configuration.value.public_ip_address_id, null)
      private_ip_address_allocation = try(frontend_ip_configuration.value.private_ip_address_allocation, null)
      private_ip_address            = try(frontend_ip_configuration.value.private_ip_address, null)
      subnet_id                     = try(frontend_ip_configuration.value.subnet_id, null)
    }
  }

  dynamic "backend_address_pool" {
    for_each = var.appgw_config.backend_address_pools
    content {
      name  = backend_address_pool.value.name
      fqdns = backend_address_pool.value.fqdns
    }
  }

  dynamic "backend_http_settings" {
    for_each = var.appgw_config.backend_http_settings
    content {
      name                                = backend_http_settings.value.name
      cookie_based_affinity               = backend_http_settings.value.cookie_based_affinity
      port                                = backend_http_settings.value.port
      path                                = backend_http_settings.value.path
      protocol                            = backend_http_settings.value.protocol
      request_timeout                     = backend_http_settings.value.request_timeout
      probe_name                          = backend_http_settings.value.probe_name
      pick_host_name_from_backend_address = try(backend_http_settings.value.pick_host_name_from_backend_address, null)
    }
  }

  dynamic "http_listener" {
    for_each = var.appgw_config.http_listeners
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      host_names                     = length(http_listener.value.host_names) > 0 ? flatten([for host in http_listener.value.host_names : [host]]) : null
      require_sni                    = http_listener.value.require_sni
      protocol                       = http_listener.value.protocol
      ssl_certificate_name           = try(http_listener.value.ssl_certificate_name, null)

      # Condición para que solo aplique a "b2b"
      dynamic "custom_error_configuration" {
        for_each = (http_listener.value.name == "portal-https-listener" ? try(http_listener.value.custom_error_configuration, []) : [])
        content {
          status_code           = custom_error_configuration.value.status_code
          custom_error_page_url = custom_error_configuration.value.custom_error_page_url
        }
      }
    }
  }


  dynamic "url_path_map" {
    for_each = var.appgw_config.url_path_maps
    content {
      name                               = url_path_map.value.name
      default_backend_address_pool_name  = url_path_map.value.default_backend_address_pool_name
      default_backend_http_settings_name = url_path_map.value.default_backend_http_settings_name

      dynamic "path_rule" {
        for_each = url_path_map.value.path_rule
        content {
          name                       = path_rule.value.name
          paths                      = path_rule.value.paths
          backend_address_pool_name  = path_rule.value.backend_address_pool_name
          backend_http_settings_name = path_rule.value.backend_http_settings_name
        }
      }

    }
  }

  dynamic "request_routing_rule" {
    for_each = var.appgw_config.request_routing_rules
    content {
      name                        = request_routing_rule.value.name
      rule_type                   = request_routing_rule.value.rule_type
      priority                    = request_routing_rule.value.priority
      http_listener_name          = request_routing_rule.value.http_listener_name
      backend_address_pool_name   = try(request_routing_rule.value.backend_address_pool_name, null)
      backend_http_settings_name  = try(request_routing_rule.value.backend_http_settings_name, null)
      redirect_configuration_name = try(request_routing_rule.value.redirect_configuration_name, null)
      rewrite_rule_set_name       = try(request_routing_rule.value.rewrite_rule_set_name, null)
      url_path_map_name           = try(request_routing_rule.value.url_path_map_name, null)
    }
  }

  dynamic "redirect_configuration" {
    for_each = var.appgw_config.redirect_configurations
    content {
      name                 = redirect_configuration.value.name
      redirect_type        = redirect_configuration.value.redirect_type
      target_listener_name = try(redirect_configuration.value.target_listener_name, null)
      target_url           = try(redirect_configuration.value.target_url, null)
      include_path         = try(redirect_configuration.value.include_path, null)
      include_query_string = try(redirect_configuration.value.include_query_string, null)
    }
  }

  dynamic "probe" {
    for_each = var.appgw_config.probes
    content {
      name                                      = probe.value.name
      protocol                                  = probe.value.protocol
      host                                      = probe.value.host
      unhealthy_threshold                       = probe.value.unhealthy_threshold
      timeout                                   = probe.value.timeout
      interval                                  = probe.value.interval
      path                                      = probe.value.path
      pick_host_name_from_backend_http_settings = probe.value.pick_host_name_from_backend_http_settings
    }
  }

  dynamic "ssl_certificate" {
    for_each = var.appgw_config.ssl_certificates
    content {
      name     = ssl_certificate.value.name
      data     = filebase64("${path.module}/certificates/${ssl_certificate.value.data}")
      password = ssl_certificate.value.password
    }
  }

  tags = var.tags
}

