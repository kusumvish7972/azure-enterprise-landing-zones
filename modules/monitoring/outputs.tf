output "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.law.id
}

output "log_analytics_workspace_name" {
  description = "The Name of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.law.name
}

output "application_insights_id" {
  description = "The ID of Application Insights"
  value       = azurerm_application_insights.appinsights.id
}

output "application_insights_connection_string" {
  description = "The Connection String for Application Insights"
  value       = azurerm_application_insights.appinsights.connection_string
  sensitive   = true
}

output "action_group_id" {
  description = "The ID of the Critical Alerts Action Group"
  value       = azurerm_monitor_action_group.critical_alerts.id
}

