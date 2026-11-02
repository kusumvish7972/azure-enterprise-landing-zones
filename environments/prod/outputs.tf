output "resource_group_name" {
  description = "Name of the production resource group"
  value       = azurerm_resource_group.main.name
}

output "hub_vnet_id" {
  description = "Production Hub Virtual Network ID"
  value       = module.networking.hub_vnet_id
}

output "spoke_vnet_id" {
  description = "Production Spoke Virtual Network ID"
  value       = module.networking.spoke_vnet_id
}

output "aks_cluster_name" {
  description = "Production AKS cluster name"
  value       = module.aks.aks_cluster_name
}

output "key_vault_uri" {
  description = "Production Azure Key Vault URI"
  value       = module.security.key_vault_uri
}

output "sql_server_fqdn" {
  description = "Production SQL Server FQDN"
  value       = module.database.sql_server_fqdn
}

