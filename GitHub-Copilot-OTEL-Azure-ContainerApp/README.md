# Send GitHub Copilot CLI telemetry to Azure Application Insights
I wanted to send GitHub Copilot CLI telemetry to Azure Application Insights so I could query model requests, token usage and tool executions, including which skills were being used, with KQL. I used an OpenTelemetry Collector running on Azure Container Apps to receive telemetry from the CLI and forward it to Application Insights.

The Collector provides an authenticated OTLP endpoint for developer machines, with the Azure export configuration held centrally in the Container App. Application Insights stores the telemetry for queries and Azure Workbooks.

[Blog Post](https://https://thomasthornton.cloud/2023/04/14/using-github-actions-variables-as-terraform-variables/)

[GitHub Repo Setup](https://github.com/thomast1906/github-copilot-otel-azure-containerapp)