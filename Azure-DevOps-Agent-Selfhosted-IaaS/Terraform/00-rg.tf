# Resource Group
resource "azurerm_resource_group" "tamops" {
  name     = var.rg_name
  location = var.location
}