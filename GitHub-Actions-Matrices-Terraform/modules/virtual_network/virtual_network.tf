resource "azurerm_virtual_network" "virtual_network" {
  address_space = [
    var.network_address_space,
  ]

  location = var.location

  name = format("vnet-%s-%s-%s",
    var.environment,
    var.region,
    var.instance_number
  )

  resource_group_name = var.resource_group_name

  tags = var.tags

}