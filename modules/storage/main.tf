# ==============================================================================
# Enterprise Storage Module: Hardened Storage Account with Private Endpoint
# ==============================================================================

resource "azurerm_storage_account" "sa" {
  name                     = "sa${var.environment}${var.unique_suffix}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.replication_type
  account_kind             = "StorageV2"

  # Security & Compliance Gates
  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = var.public_network_access_enabled

  blob_properties {
    versioning_enabled = true
    delete_retention_policy {
      days = 30
    }
    container_delete_retention_policy {
      days = 30
    }
  }

  tags = var.tags
}

# Default Secure Container for Artifacts / State
resource "azurerm_storage_container" "core" {
  name                  = "artifacts"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

# Storage Account Private Endpoint
resource "azurerm_private_endpoint" "blob_pe" {
  count               = var.subnet_id_for_private_endpoint != "" ? 1 : 0
  name                = "pe-storage-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id_for_private_endpoint

  private_service_connection {
    name                           = "psc-storage-${var.environment}"
    private_connection_resource_id = azurerm_storage_account.sa.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  tags = var.tags
}

