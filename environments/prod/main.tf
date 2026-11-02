# ==============================================================================
# Parent Module: Mission-Critical Production Environment (Tier-1 Prod)
# ==============================================================================

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

locals {
  environment = "prod"
  common_tags = merge(var.tags, {
    Environment      = local.environment
    ManagedBy        = "Terraform"
    Owner            = var.owner
    Tier             = "Production-MissionCritical"
    ComplianceScope  = "PCI-DSS-ISO27001"
    DataClass        = "Confidential"
  })
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${local.environment}"
  location = var.location
  tags     = local.common_tags
}

# 1. Monitoring & 24/7 SRE Observability
module "monitoring" {
  source              = "../../modules/monitoring"
  environment         = local.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  retention_in_days   = 90
  alert_email_address = var.alert_email_address
  tags                = local.common_tags
}

# 2. Enterprise Hub & Spoke Network (Isolated Prod CIDR)
module "networking" {
  source                 = "../../modules/networking"
  environment            = local.environment
  location               = var.location
  resource_group_name    = azurerm_resource_group.main.name
  hub_address_space      = "10.100.0.0/16"
  firewall_subnet_prefix = "10.100.1.0/24"
  gateway_subnet_prefix  = "10.100.2.0/24"
  spoke_address_space    = "10.200.0.0/16"
  app_subnet_prefix      = "10.200.1.0/24"
  aks_subnet_prefix      = "10.200.2.0/23"
  data_subnet_prefix     = "10.200.4.0/24"
  tags                   = local.common_tags
}

# 3. Security & Key Vault (Zero-Trust, Purge Protected)
module "security" {
  source                         = "../../modules/security"
  environment                    = local.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  purge_protection_enabled       = true
  enable_public_access           = false
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

# 4. Storage with Geo-Redundancy (GRS) & Versioning
module "storage" {
  source                         = "../../modules/storage"
  environment                    = local.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  replication_type               = "GRS" # Geo-Redundant Storage
  public_network_access_enabled   = false
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

# 5. Production AKS Cluster (High-Concurrency Auto-scaling)
module "aks" {
  source                     = "../../modules/compute_aks"
  environment                = local.environment
  location                   = var.location
  resource_group_name        = azurerm_resource_group.main.name
  subnet_id                  = module.networking.aks_subnet_id
  node_vm_size               = "Standard_D8s_v5" # Compute-optimized
  node_count                 = 3
  min_node_count             = 3
  max_node_count             = 12
  log_analytics_workspace_id = module.monitoring.log_analytics_workspace_id
  tags                       = local.common_tags
}

# 6. Production Azure SQL Database (Business Continuity)
module "database" {
  source                         = "../../modules/database_sql"
  environment                    = local.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  admin_username                 = var.db_admin_username
  admin_password                 = var.db_admin_password
  database_sku_name              = "GP_Gen5_4"
  database_max_size_gb           = 250
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

