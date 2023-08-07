## Terraform Module does not declare a provider warning

## Terraform Module does not declare a provider warning

Deploying Terraform to Azure using a module and notice a warning similar to the below? In this blog post I will show how you can fix the warning

"Module module.storageaccount does not declare a provider named azurerm.storageaccount. If you wish to specify a provider configuration for the module, add an entry for azurerm.storageaccount in the required_providers block within the module."

### Purpose
This repository contains code that addresses a common warning encountered when deploying Terraform to Azure using a module. The code demonstrates how to declare a provider within a module to avoid this warning.

### Usage
To use this code, clone the repository and run the Terraform script. The script will deploy a module to Azure and declare a provider, preventing the warning from appearing.

### Prerequisites/Dependencies
You will need Terraform installed and an Azure account. You will also need to have a module that you wish to deploy to Azure.

[Blog post here](https://thomasthornton.cloud/2021/07/07/terraform-module-does-not-declare-a-provider-warning/)