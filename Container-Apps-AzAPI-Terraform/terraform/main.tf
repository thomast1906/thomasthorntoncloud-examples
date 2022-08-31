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

resource "azapi_resource" "containerapp_environment" {
  type      = "Microsoft.App/managedEnvironments@2022-03-01"
  name      = "${var.aca_name}acae"
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


resource "azapi_resource" "containerapp" {
  for_each  = local.apps
  type      = "Microsoft.App/containerapps@2022-03-01"
  name      = "${each.key}acae"
  parent_id = azurerm_resource_group.rg.id
  location  = azurerm_resource_group.rg.location

  body = jsonencode({
    properties = {
      managedEnvironmentId = azapi_resource.containerapp_environment.id
      configuration = {
        ingress = {
          external : true,
          targetPort : each.value.targetPort
        },

      }
      template = {
        containers = [
          {
            image = each.value.image,
            name  = each.value.imagename
            resources = {
              cpu    = each.value.cpu
              memory = each.value.memory
            }
          }
        ]
        scale = {
          minReplicas = each.value.minReplicas,
          maxReplicas = each.value.maxReplicas
        }
      }
    }

  })
  depends_on = [
    azapi_resource.containerapp_environment
  ]
}
