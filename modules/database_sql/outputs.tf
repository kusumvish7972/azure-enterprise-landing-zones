output "sql_server_id" {
  description = "The ID of the Azure SQL Server"
  value       = azurerm_mssql_server.sql.id
}

output "sql_server_fqdn" {
  description = "The Fully Qualified Domain Name of the Azure SQL Server"
  value       = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "database_id" {
  description = "The ID of the Azure SQL Database"
  value       = azurerm_mssql_database.db.id
}

output "database_name" {
  description = "The Name of the Azure SQL Database"
  value       = azurerm_mssql_database.db.name
}

output "private_endpoint_ip" {
  description = "The Private IP assigned to the SQL Server private endpoint"
  value       = azurerm_private_endpoint.sql_pe.private_service_connection[0].private_ip_address
}

