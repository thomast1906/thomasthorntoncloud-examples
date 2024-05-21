resource "azurerm_resource_group" "rg" {
  name     = "tamops-cs-rg"
  location = "West Europe"
}

resource "azurerm_cognitive_account" "cognitive_account" {
  name                = "tamops-cs"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "ContentSafety"
  sku_name            = "S0"

  depends_on = [
    azurerm_resource_group.rg
  ]
}