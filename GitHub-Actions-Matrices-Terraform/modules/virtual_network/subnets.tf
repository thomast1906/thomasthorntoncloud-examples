resource "azurerm_subnet" "additional_subnets" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                                           = each.value.name
  address_prefixes                               = [each.value.address_prefix]
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.virtual_network.name
  enforce_private_link_endpoint_network_policies = each.value.enable_pe_policy

  service_endpoints = each.value.service_endpoints

  dynamic "delegation" {
    for_each = lookup(each.value, "service_delegations", [])
    content {
      name = lookup(delegation.value, "name", null)
      dynamic "service_delegation" {
        for_each = lookup(delegation.value, "service_delegation", [])
        content {
          name    = lookup(service_delegation.value, "name", null)
          actions = lookup(service_delegation.value, "actions", null)
        }
      }
    }
  }

}
