output "log_analytics_id" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.id
}

output "retention_in_days" {
  value = var.retention_in_days
}