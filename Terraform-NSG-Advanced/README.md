## Advanced Azure Network Security Group Rule Creation Using Terraform

Following on from my popular blog post: Network Security Group Rule Creation using Terraform, lets look at a more advanced variation of this. In this post, we'll look at how to incorporate multiple possible options for rules using the try function with for_each on all possible arguments for azurerm_network_security_rule.

[Blog post here](https://thomasthornton.cloud/2022/07/01/using-the-terraform-resource-azapi_update_resource-to-update-azure-resources-that-are-not-yet-supported-in-azurerm-provider/)
