resource "azurerm_resource_group" "tamopsrg" {
  name     = "${var.rg_name}-${var.environment}"
  location = "West Europe"
}
