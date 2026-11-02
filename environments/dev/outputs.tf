output "resource_group_name" {
  description = "Name of the provisioned resource group"
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
  description = "Name of the provisioned AKS cluster"
  value       = module.aks.aks_cluster_name
}

output "key_vault_uri" {
  description = "URI of the provisioned Azure Key Vault"
  value       = module.security.key_vault_uri
}

output "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID"
  value       = module.monitoring.log_analytics_workspace_id
}

output "sql_server_fqdn" {
  description = "Fully Qualified Domain Name of SQL Server"
  value       = module.database.sql_server_fqdn
}

