# ==============================================================================
# Enterprise Security Module: Azure Key Vault (RBAC & Purge Protection)
# ==============================================================================

data "azurerm_client_config" "current" {}

resource "azurerm_user_assigned_identity" "workload_id" {
  name                = "id-${var.environment}-workload"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_key_vault" "kv" {
  name                        = "kv-${var.environment}-${var.unique_suffix}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  
  # Security Hardening
  enable_rbac_authorization   = true
  purge_protection_enabled    = var.purge_protection_enabled
  soft_delete_retention_days  = 90
  public_network_access_enabled = var.enable_public_access

  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = var.allowed_subnet_ids
    ip_rules                   = var.allowed_ip_rules
  }

  tags = var.tags
}

# Key Vault Private Endpoint
resource "azurerm_private_endpoint" "kv_pe" {
  count               = var.subnet_id_for_private_endpoint != "" ? 1 : 0
  name                = "pe-kv-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id_for_private_endpoint

  private_service_connection {
    name                           = "psc-kv-${var.environment}"
    private_connection_resource_id = azurerm_key_vault.kv.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  tags = var.tags
}

