resource "azurerm_resource_group" "tamopsrg" {
  name     = var.rg_name
  location = var.location

  lifecycle {
    precondition {
      condition     = contains(["uksouth", "ukwest"], var.location)
      error_message = "Location must be either 'uksouth' or 'ukwest'."
    }

    precondition {
      condition     = contains(["tamops-rg"], var.rg_name)
      error_message = "RG name must be tamops-rg'."
    }
  }
}

resource "azurerm_virtual_network" "tamopsvnet" {
  name                = "${var.rg_name}-vnet"
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.tamopsrg.location
  resource_group_name = azurerm_resource_group.tamopsrg.name

  lifecycle {
    precondition {
      condition     = cidrsubnet(var.vnet_address_space, 8, 0) != ""
      error_message = "The VNet address space must support at least 256 addresses."
    }
  }
}