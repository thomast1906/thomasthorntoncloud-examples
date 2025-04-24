## How to use If-Else in Terraform

Ephemeral resources are Terraform resources that are essentially temporary. Ephemeral resources have a unique lifecycle, and Terraform does not store information about ephemeral resources in state or plan files. Each ephemeral block describes one or more ephemeral resources, such as a temporary password or connection to another system. (you must use Terraform v.1.11 or later and use a resource that supports write-only arguments)

In this blog post, I will cover what are ephmeral resources, why write-only arguments should be used and an example both being used in Azure to store and retrieve sensitive values without them being stored in the state file.

[Blog post here](https://thomasthornton.cloud/2023/10/16/how-to-use-if-else-in-terraform/)
