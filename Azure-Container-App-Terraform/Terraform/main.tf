resource "azurerm_resource_group" "rg" {
  name     = "${var.aca_name}rg"
  location = var.location
}

resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                = "${var.aca_name}la"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

data "azurerm_container_registry" "acr" {
  name                = "tamopsactionacr"
  resource_group_name = "tamops-acr-github"
}

resource "azurerm_container_app_environment" "containerappenv" {
  name                       = "${var.aca_name}containerappenv"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.loganalytics.id
}

resource "azurerm_user_assigned_identity" "containerapp" {
  location            = azurerm_resource_group.rg.location
  name                = "containerappmi"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_role_assignment" "containerapp" {
  scope                = data.azurerm_container_registry.acr.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_user_assigned_identity.containerapp.principal_id
  depends_on = [
    azurerm_user_assigned_identity.containerapp
  ]
}

resource "azurerm_container_app" "containerapp" {
  name                         = "${var.aca_name}app"
  container_app_environment_id = azurerm_container_app_environment.containerappenv.id
  resource_group_name          = azurerm_resource_group.rg.name
  revision_mode                = "Multiple"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.containerapp.id]
  }

  registry {
    server   = data.azurerm_container_registry.acr.login_server
    identity = azurerm_user_assigned_identity.containerapp.id
  }

  #   ingress {
  #     external_enabled = true
  #     target_port = 80
  #     traffic_weight {
  #       percentage = 100
  #     }
  #     }
  template {
    container {
      name   = "firstcontainerappacracr"
      image  = "${data.azurerm_container_registry.acr.login_server}/aspcoresample:76ef8d9511d310649729a28563fdf6d133338e30"
      cpu    = 0.25
      memory = "0.5Gi"

      readiness_probe {
        transport = "HTTP"
        port      = 80
      }

      liveness_probe {
        transport = "HTTP"
        port      = 80
      }

      startup_probe {
        transport = "HTTP"
        port      = 80
      }
    }
  }

}