# ==============================================================================
# Parent Module: Development Environment (Dev)
# ==============================================================================

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

locals {
  environment = "dev"
  common_tags = merge(var.tags, {
    Environment = local.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
    CostCenter  = "DevOps-Architecture"
  })
}

# 1. Base Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${local.environment}"
  location = var.location
  tags     = local.common_tags
}

# 2. Child Module: Enterprise Monitoring & Observability
module "monitoring" {
  source              = "../../modules/monitoring"
  environment         = local.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  retention_in_days   = 30
  alert_email_address = var.alert_email_address
  tags                = local.common_tags
}

# 3. Child Module: Hub & Spoke Networking Tier
module "networking" {
  source                 = "../../modules/networking"
  environment            = local.environment
  location               = var.location
  resource_group_name    = azurerm_resource_group.main.name
  hub_address_space      = "10.10.0.0/16"
  firewall_subnet_prefix = "10.10.1.0/24"
  gateway_subnet_prefix  = "10.10.2.0/24"
  spoke_address_space    = "10.20.0.0/16"
  app_subnet_prefix      = "10.20.1.0/24"
  aks_subnet_prefix      = "10.20.2.0/23"
  data_subnet_prefix     = "10.20.4.0/24"
  tags                   = local.common_tags
}

# 4. Child Module: Zero-Trust Security & Key Vault
module "security" {
  source                         = "../../modules/security"
  environment                    = local.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  purge_protection_enabled       = false # Relaxed for dev testing
  enable_public_access           = false
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

# 5. Child Module: Hardened Storage Account
module "storage" {
  source                         = "../../modules/storage"
  environment                    = local.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  replication_type               = "LRS" # Cost optimized for dev
  public_network_access_enabled   = false
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

# 6. Child Module: Azure Kubernetes Service (AKS)
module "aks" {
  source                     = "../../modules/compute_aks"
  environment                = local.environment
  location                   = var.location
  resource_group_name        = azurerm_resource_group.main.name
  subnet_id                  = module.networking.aks_subnet_id
  node_vm_size               = "Standard_B2s" # Cost-effective dev size
  node_count                 = 2
  min_node_count             = 1
  max_node_count             = 3
  log_analytics_workspace_id = module.monitoring.log_analytics_workspace_id
  tags                       = local.common_tags
}

# 7. Child Module: Azure SQL Database
module "database" {
  source                         = "../../modules/database_sql"
  environment                    = local.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  admin_username                 = var.db_admin_username
  admin_password                 = var.db_admin_password
  database_sku_name              = "Basic" # Cost-effective dev SKU
  database_max_size_gb           = 5
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

