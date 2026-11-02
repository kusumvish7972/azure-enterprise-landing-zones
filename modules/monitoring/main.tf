# ==============================================================================
# Enterprise Monitoring Module: Observability, Log Analytics & App Insights
# ==============================================================================

resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-${var.environment}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}

resource "azurerm_application_insights" "appinsights" {
  name                = "appi-${var.environment}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.law.id
  application_type    = "web"
  tags                = var.tags
}

resource "azurerm_monitor_action_group" "critical_alerts" {
  name                = "ag-${var.environment}-critical"
  resource_group_name = var.resource_group_name
  short_name          = "crit-alert"

  email_receiver {
    name                    = "OperationsLead"
    email_address           = var.alert_email_address
    use_common_alert_schema = true
  }

  tags = var.tags
}

