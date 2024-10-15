## Automating Logic App Deployments: From Designer to Terraform

I have been using several Logic Apps recently. I wanted to fully automate the setup and configuration using Terraform. In this blog post I will be showing you how to automate the Logic App Designer to Terraform. Its a slightly different blog post than usual, rather than full blown automation from the start, in this post its going to be a multi-step process:

1. Create the base Logic App Workflow deployment
2. Use the Logic App Designer in Azure Portal to create the required configuration
3. Use `azurerm_resource_group_template_deployment` in Terraform to automate the manual design from above

You might be wondering why we're not going for full automation from the start. Trust me, I've explored various methods, and this approach has proven to be the most practical (my personal thoughts anyways :) )

[Blog post here](https://thomasthornton.cloud/2022/07/01/using-the-terraform-resource-azapi_update_resource-to-update-azure-resources-that-are-not-yet-supported-in-azurerm-provider/)
