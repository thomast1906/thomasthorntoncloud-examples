resource "azurerm_resource_group" "rg" {
  name     = "${var.aca_name}-rg"
  location = var.location
}

resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                = "${var.aca_name}-la"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

data "azurerm_resource_group" "acr" {
  name = "tamops-acr-github"
}

data "azurerm_container_registry" "acr" {
  name                = "tamopsactionacr"
  resource_group_name = data.azurerm_resource_group.acr.name
}

resource "azapi_resource" "containerapp_environment" {
  type      = "Microsoft.App/managedEnvironments@2022-03-01"
  name      = "${var.aca_name}env"
  parent_id = azurerm_resource_group.rg.id
  location  = azurerm_resource_group.rg.location

  body = jsonencode({
    properties = {
      appLogsConfiguration = {
        destination = "log-analytics"
        logAnalyticsConfiguration = {
          customerId = azurerm_log_analytics_workspace.loganalytics.workspace_id
          sharedKey  = azurerm_log_analytics_workspace.loganalytics.primary_shared_key
        }
      }
    }
  })
}

resource "azurerm_user_assigned_identity" "containerapp" {
  location            = azurerm_resource_group.rg.location
  name                = "containerappmi"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_role_assignment" "containerapp" {
  scope                = data.azurerm_resource_group.acr.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_user_assigned_identity.containerapp.principal_id
  depends_on = [
    azurerm_user_assigned_identity.containerapp
  ]
}

resource "azapi_resource" "containerapp" {
  type      = "Microsoft.App/containerapps@2022-03-01"
  name      = var.aca_name
  parent_id = azurerm_resource_group.rg.id
  location  = azurerm_resource_group.rg.location


  identity {
    type         = "SystemAssigned, UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.containerapp.id]
  }
  body = jsonencode({

    properties = {
      managedEnvironmentId = azapi_resource.containerapp_environment.id
      configuration = {
        ingress = {
          external : true,
          targetPort : 80
        },
        "registries" : [
          {
            "server" : data.azurerm_container_registry.acr.login_server,
            "identity" : azurerm_user_assigned_identity.containerapp.id
          }
        ]
      }
      template = {
        containers = [
          {
            image = "${data.azurerm_container_registry.acr.login_server}/aspcoresample:76ef8d9511d310649729a28563fdf6d133338e30",
            name  = "firstcontainerappacracr"
            resources = {
              cpu    = 0.25
              memory = "0.5Gi"
            },
            "probes" : [
              {
                "type" : "Liveness",
                "httpGet" : {
                  "path" : "/",
                  "port" : 80,
                  "scheme" : "HTTP"
                },
                "periodSeconds" : 10
              },
              {
                "type" : "Readiness",
                "httpGet" : {
                  "path" : "/",
                  "port" : 80,
                  "scheme" : "HTTP"
                },
                "periodSeconds" : 10
              },
              {
                "type" : "Startup",
                "httpGet" : {
                  "path" : "/",
                  "port" : 80,
                  "scheme" : "HTTP"
                },
                "periodSeconds" : 10
              }
            ]
          }
        ]
        scale = {
          minReplicas = 0,
          maxReplicas = 2
        }
      }
    }

  })
  ignore_missing_property = true
  depends_on = [
    azapi_resource.containerapp_environment
  ]
}