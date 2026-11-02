output "hub_vnet_id" {
  description = "The ID of the Hub Virtual Network"
  value       = azurerm_virtual_network.hub.id
}

output "hub_vnet_name" {
  description = "The name of the Hub Virtual Network"
  value       = azurerm_virtual_network.hub.name
}

output "spoke_vnet_id" {
  description = "The ID of the Spoke Virtual Network"
  value       = azurerm_virtual_network.spoke.id
}

output "spoke_vnet_name" {
  description = "The name of the Spoke Virtual Network"
  value       = azurerm_virtual_network.spoke.name
}

output "app_subnet_id" {
  description = "Subnet ID for application workloads"
  value       = azurerm_subnet.app.id
}

output "aks_subnet_id" {
  description = "Subnet ID for AKS workloads"
  value       = azurerm_subnet.aks.id
}

output "data_subnet_id" {
  description = "Subnet ID for database workloads with private endpoint policies"
  value       = azurerm_subnet.data.id
}

output "network_resource_group_name" {
  description = "Resource group name of networking resources"
  value       = azurerm_resource_group.net_rg.name
}

