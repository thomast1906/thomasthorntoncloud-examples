resource "azurerm_resource_group" "tamopsrg" {
  name     = "tamops-logicapps-rg"
  location = "Uk South"
}

resource "azurerm_user_assigned_identity" "tamops-logicapp-mi" {
  resource_group_name = azurerm_resource_group.tamopsrg.name
  location            = azurerm_resource_group.tamopsrg.location
  name                = "tamops-logicapp-mi"
}

resource "azurerm_logic_app_workflow" "tamops-logicapp" {
  name                = "tamopslogicapp1"
  location            = azurerm_resource_group.tamopsrg.location
  resource_group_name = azurerm_resource_group.tamopsrg.name

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.tamops-logicapp-mi.id]
  }

  depends_on = [azurerm_user_assigned_identity.tamops-logicapp-mi]
}

