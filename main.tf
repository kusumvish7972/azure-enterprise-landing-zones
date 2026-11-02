# ==============================================================================
# Enterprise Multi-Tier Cloud Infrastructure (Root Orchestration Module)
# ==============================================================================
# This root module orchestrates enterprise child modules:
#   - Networking (Hub & Spoke, NSG, Firewalls)
#   - Security & Identity (Key Vault, Managed Identity, Private Endpoints)
#   - Storage (TLS 1.3, Encrypted Blobs)
#   - Compute (Azure Kubernetes Service AKS with Auto-scaler)
#   - Database (Azure SQL Server & DB with TDE & Auditing)
#   - Monitoring & Observability (Log Analytics & Application Insights)
# ==============================================================================

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

locals {
  common_tags = merge(var.tags, {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
    Owner       = var.owner
  })
}

# 1. Base Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
  tags     = local.common_tags
}

# 2. Observability & Monitoring
module "monitoring" {
  source              = "./modules/monitoring"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  retention_in_days   = var.log_retention_days
  alert_email_address = var.alert_email_address
  tags                = local.common_tags
}

# 3. Enterprise Hub & Spoke Networking
module "networking" {
  source                 = "./modules/networking"
  environment            = var.environment
  location               = var.location
  resource_group_name    = azurerm_resource_group.main.name
  hub_address_space      = var.hub_address_space
  firewall_subnet_prefix = var.firewall_subnet_prefix
  gateway_subnet_prefix  = var.gateway_subnet_prefix
  spoke_address_space    = var.spoke_address_space
  app_subnet_prefix      = var.app_subnet_prefix
  aks_subnet_prefix      = var.aks_subnet_prefix
  data_subnet_prefix     = var.data_subnet_prefix
  tags                   = local.common_tags
}

# 4. Zero-Trust Security & Key Vault
module "security" {
  source                         = "./modules/security"
  environment                    = var.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  purge_protection_enabled       = var.environment == "prod" ? true : false
  enable_public_access           = false
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

# 5. Encrypted Enterprise Storage
module "storage" {
  source                         = "./modules/storage"
  environment                    = var.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  replication_type               = var.environment == "prod" ? "GRS" : "LRS"
  public_network_access_enabled   = false
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

# 6. Hardened Azure Kubernetes Service (AKS)
module "aks" {
  source                     = "./modules/compute_aks"
  environment                = var.environment
  location                   = var.location
  resource_group_name        = azurerm_resource_group.main.name
  subnet_id                  = module.networking.aks_subnet_id
  node_vm_size               = var.aks_node_vm_size
  node_count                 = var.aks_node_count
  min_node_count             = var.aks_min_node_count
  max_node_count             = var.aks_max_node_count
  log_analytics_workspace_id = module.monitoring.log_analytics_workspace_id
  tags                       = local.common_tags
}

# 7. Enterprise Azure SQL Database
module "database" {
  source                         = "./modules/database_sql"
  environment                    = var.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  admin_username                 = var.db_admin_username
  admin_password                 = var.db_admin_password
  database_sku_name              = var.db_sku_name
  database_max_size_gb           = var.db_max_size_gb
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

