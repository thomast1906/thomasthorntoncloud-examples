## Importing Terraform state at scale in Azure

In my previous blog post, I detailed how to import 3 Azure resources until Terraform state, a manual approach that is fine for a few resources; what happens if there are 100s of the same resource already configured in Azure?

Recently in my current project I was wanting to import 300+ private DNS A Records into terraform state, this couldn't have been a manual approach as it would have taken so long!

What did I decide to do? Create a script to do this using bash/AZ CLI

[Blog post here](https://thomasthornton.cloud/2021/04/08/importing-terraform-state-at-scale-in-azure/)