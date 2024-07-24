locals {
  nsgrules = {
    rdp = {
      name                       = "rdp"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    AD = {
      name                         = "AD"
      priority                     = 110
      direction                    = "Inbound"
      access                       = "Allow"
      protocol                     = "Tcp"
      source_port_range            = "*"
      destination_port_ranges      = "53,389,636"
      source_address_prefixes      = ["10.100.52.39/32", "10.100.52.49/32"]
      destination_address_prefixes = ["10.100.52.10/32", "10.100.62.10/32"]
    }
  }
}

resource "azurerm_resource_group" "tamopsrg" {
  name     = "tamopsrg"
  location = "uksouth"
}

resource "azurerm_network_security_group" "tamopsnsg" {
  name                = "tamopsnsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_network_security_rule" "testrules" {
  for_each = local.nsgrules

  name                   = each.value.name
  priority               = each.value.priority
  direction              = each.value.direction
  access                 = each.value.access
  protocol               = each.value.protocol
  source_port_range      = each.value.source_port_range
  destination_port_range = each.value.destination_port_range

  source_address_prefixes      = try(each.value.source_address_prefixes, null)
  source_address_prefix        = try(each.value.source_address_prefix, null)
  destination_address_prefixes = try(each.value.destination_address_prefixes, null)
  destination_address_prefix   = try(each.value.destination_address_prefix, null)

  resource_group_name         = azurerm_resource_group.tamopsrg.name
  network_security_group_name = azurerm_network_security_group.tamopsnsg.name
}
