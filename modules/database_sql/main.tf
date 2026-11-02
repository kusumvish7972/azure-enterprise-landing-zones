# ==============================================================================
# Enterprise Database Module: Azure SQL with TDE, Auditing & Private Endpoint
# ==============================================================================

resource "azurerm_mssql_server" "sql" {
  name                         = "sql-${var.environment}-${var.unique_suffix}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  minimum_tls_version          = "1.2"
  public_network_access_enabled = false

  identity {
    type = "SystemAssigned"
  }

  azuread_administrator {
    login_username = var.aad_admin_login_name
    object_id      = var.aad_admin_object_id
  }

  tags = var.tags
}

resource "azurerm_mssql_database" "db" {
  name         = "sqldb-${var.environment}-core"
  server_id    = azurerm_mssql_server.sql.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "BasePrice"
  max_size_gb  = var.database_max_size_gb
  sku_name     = var.database_sku_name

  transparent_data_encryption_enabled = true

  tags = var.tags
}

# Private Endpoint for SQL Server
resource "azurerm_private_endpoint" "sql_pe" {
  name                = "pe-sql-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id_for_private_endpoint

  private_service_connection {
    name                           = "psc-sql-${var.environment}"
    private_connection_resource_id = azurerm_mssql_server.sql.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  tags = var.tags
}

