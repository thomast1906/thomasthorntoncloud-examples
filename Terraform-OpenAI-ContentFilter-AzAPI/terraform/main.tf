resource "azurerm_resource_group" "rg" {
  name     = "tamops-openai-rg"
  location = "West Europe"
}

resource "azurerm_cognitive_account" "cognitive_account" {
  name                = "tamops-ca"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "OpenAI"
  sku_name            = "S0"

  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "azurerm_cognitive_deployment" "cognitive_deployment" {
  name                 = "tamops-gpt35"
  cognitive_account_id = azurerm_cognitive_account.cognitive_account.id
  rai_policy_name      = "tamopscontentfilter"
  model {
    format  = "OpenAI"
    name    = "gpt-35-turbo"
    version = "0301"
  }

  scale {
    type = "Standard"
  }

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_cognitive_account.cognitive_account
  ]
}

resource "azapi_resource" "content_filter" {
  type      = "Microsoft.CognitiveServices/accounts/raiPolicies@2023-10-01-preview"
  name      = "tamopscontentfilter"
  parent_id = azurerm_cognitive_account.cognitive_account.id

  schema_validation_enabled = false

  body = jsonencode({
    properties = {
      mode           = "Default",
      basePolicyName = "Microsoft.Default",
      contentFilters = [
        { name = "hate", blocking = true, enabled = true, allowedContentLevel = "High", source = "Prompt" },
        { name = "sexual", blocking = true, enabled = true, allowedContentLevel = "High", source = "Prompt" },
        { name = "selfharm", blocking = true, enabled = true, allowedContentLevel = "High", source = "Prompt" },
        { name = "violence", blocking = true, enabled = true, allowedContentLevel = "High", source = "Prompt" },
        { name = "hate", blocking = true, enabled = true, allowedContentLevel = "High", source = "Completion" },
        { name = "sexual", blocking = true, enabled = true, allowedContentLevel = "High", source = "Completion" },
        { name = "selfharm", blocking = true, enabled = true, allowedContentLevel = "High", source = "Completion" },
        { name = "violence", blocking = true, enabled = true, allowedContentLevel = "High", source = "Completion" },
        { name = "jailbreak", blocking = true, enabled = true, source = "Prompt" },
        { name = "protected_material_text", blocking = true, enabled = true, source = "Completion" },
        { name = "protected_material_code", blocking = true, enabled = true, source = "Completion" }
      ]
    }
  })
  depends_on = [
    azurerm_resource_group.rg,
    azurerm_cognitive_account.cognitive_account,
    azurerm_cognitive_deployment.cognitive_deployment
  ]
}