locals {
  resource_group_name = format("rg-%s-%s",
    var.environment,
    var.instance_number
  )

  log_analytics_workspace_name = format("law-%s-%s-%s",
    var.environment,
    var.region,
    var.instance_number
  )

}
