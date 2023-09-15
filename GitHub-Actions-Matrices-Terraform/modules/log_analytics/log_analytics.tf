resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  location = var.location

  name = format("law-%s-%s-%s",
    var.environment,
    var.region,
    var.instance_number
  )

  sku               = var.sku
  retention_in_days = var.retention_in_days

  resource_group_name = var.resource_group_name

  tags = var.tags

}
