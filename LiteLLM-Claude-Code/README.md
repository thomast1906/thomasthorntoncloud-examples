## Setting Up LiteLLM with Azure Databricks Serving Endpoints for Claude Code

As cloud AI offerings expand, we increasingly need to work with models hosted across different platforms. For example, Azure Databricks offers Claude models through their serving endpoints, but integrating them with existing tools designed for direct Anthropic API access can be tricky. This is especially challenging when you want to use powerful developer tools like Claude Code CLI with models hosted on Azure Databricks.

If you’ve ever wanted the flexibility of Claude Code’s terminal interface while using your organisation’s Azure Databricks infrastructure, you’re not alone. This guide walks you through configuring Claude Code to work with Claude models hosted on Azure Databricks, using LiteLLM as a universal API proxy.

[Blog post here](https://thomasthornton.cloud/2021/05/08/copy-azure-keyvault-secrets-to-another-keyvault-using-azure-cli/)