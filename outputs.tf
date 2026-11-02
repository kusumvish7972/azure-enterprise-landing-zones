output "resource_group_name" {
  description = "The main provisioned Resource Group"
  value       = azurerm_resource_group.main.name
}

output "hub_vnet_id" {
  description = "Hub Virtual Network ID"
  value       = module.networking.hub_vnet_id
}

output "spoke_vnet_id" {
  description = "Spoke Virtual Network ID"
  value       = module.networking.spoke_vnet_id
}

output "aks_cluster_name" {
  description = "AKS Cluster Name"
  value       = module.aks.aks_cluster_name
}

output "key_vault_uri" {
  description = "Azure Key Vault URI"
  value       = module.security.key_vault_uri
}

output "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID"
  value       = module.monitoring.log_analytics_workspace_id
}

output "sql_server_fqdn" {
  description = "Azure SQL Server FQDN"
  value       = module.database.sql_server_fqdn
}

