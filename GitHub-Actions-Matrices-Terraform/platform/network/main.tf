data "azurerm_resource_group" "resource_group" {
  name = local.resource_group_name
}

data "azurerm_log_analytics_workspace" "log_analytics" {
  name                = local.log_analytics_workspace_name
  resource_group_name = local.resource_group_name
}

module "virtual_network" {
  source = "../../modules/virtual_network"

  environment     = var.environment
  instance_number = var.instance_number
  region          = var.region

  resource_group_name = local.resource_group_name

  network_address_space     = var.virtual_network_address_space
  subnets                   = var.virtual_network_subnets

  log_analytics_workspace_id   = data.azurerm_log_analytics_workspace.log_analytics.id
  log_analytics_retention_days = data.azurerm_log_analytics_workspace.log_analytics.retention_in_days

  tags = var.tags
}

module "private_dns_zones" {
  for_each = toset(var.private_dns_zones)
  source   = "../../modules/private_dns_zone"

  azurerm_private_dns_zone_name = each.key
  resource_group_name           = local.resource_group_name

  virtual_networks_to_link = {
    (module.virtual_network.network_name) = {
      subscription_id     = data.azurerm_client_config.current.subscription_id
      resource_group_name = data.azurerm_resource_group.resource_group.name
    }
  }

  tags = var.tags
}