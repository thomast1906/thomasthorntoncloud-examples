locals {
  resource_group_name = format("rg-%s-%s",
    var.environment,
    var.instance_number
  )
}