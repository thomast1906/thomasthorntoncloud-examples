resource "azurerm_resource_group" "tamopsrg" {
  name     = "tamops-logicapps-rg"
  location = "UK South"
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

resource "azurerm_storage_account" "tamopsa" {
  name                     = "tamopslogicappsa"
  resource_group_name      = azurerm_resource_group.tamopsrg.name
  location                 = azurerm_resource_group.tamopsrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "tamopsc" {
  name                  = "tamopslogicappsc"
  storage_account_name  = azurerm_storage_account.tamopsa.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "tamops-logicapp-mi" {
  scope                = azurerm_storage_account.tamopsa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.tamops-logicapp-mi.principal_id
}

data "local_file" "logic_app" {
  filename = "${path.module}/workflow.json"
}

resource "azurerm_resource_group_template_deployment" "logic_app_deployment" {
  resource_group_name = azurerm_resource_group.tamopsrg.name
  deployment_mode     = "Incremental"
  name                = "logic-app-deployment"

  template_content = data.local_file.logic_app.content

  parameters_content = jsonencode({
    "logic_app_name" = { value = azurerm_logic_app_workflow.tamops-logicapp.name }
    "location"       = { value = azurerm_logic_app_workflow.tamops-logicapp.location }
  })

  depends_on = [azurerm_logic_app_workflow.tamops-logicapp]
}