data "azurerm_resource_group" "resource_group" {
  name = local.resource_group_name
}

module "log_analytics" {
  source = "../../modules/log_analytics"

  environment     = var.environment
  instance_number = var.instance_number
  region          = var.region

  resource_group_name = data.azurerm_resource_group.resource_group.name
  tags = var.tags

}
