output "storage_account_id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.sa.id
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.sa.name
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint"
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}

output "container_name" {
  description = "Name of the primary secure blob container"
  value       = azurerm_storage_container.core.name
}

