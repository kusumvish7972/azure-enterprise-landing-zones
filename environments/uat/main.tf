# ==============================================================================
# Parent Module: User Acceptance Testing (UAT / Staging)
# ==============================================================================

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

locals {
  environment = "uat"
  common_tags = merge(var.tags, {
    Environment = local.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
    Tier        = "Staging-PreProd"
  })
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${local.environment}"
  location = var.location
  tags     = local.common_tags
}

module "monitoring" {
  source              = "../../modules/monitoring"
  environment         = local.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  retention_in_days   = 60
  alert_email_address = var.alert_email_address
  tags                = local.common_tags
}

module "networking" {
  source                 = "../../modules/networking"
  environment            = local.environment
  location               = var.location
  resource_group_name    = azurerm_resource_group.main.name
  hub_address_space      = "10.30.0.0/16"
  firewall_subnet_prefix = "10.30.1.0/24"
  gateway_subnet_prefix  = "10.30.2.0/24"
  spoke_address_space    = "10.40.0.0/16"
  app_subnet_prefix      = "10.40.1.0/24"
  aks_subnet_prefix      = "10.40.2.0/23"
  data_subnet_prefix     = "10.40.4.0/24"
  tags                   = local.common_tags
}

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

module "storage" {
  source                         = "../../modules/storage"
  environment                    = local.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  replication_type               = "ZRS" # Zone-redundant for UAT
  public_network_access_enabled   = false
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

module "aks" {
  source                     = "../../modules/compute_aks"
  environment                = local.environment
  location                   = var.location
  resource_group_name        = azurerm_resource_group.main.name
  subnet_id                  = module.networking.aks_subnet_id
  node_vm_size               = "Standard_D4s_v5"
  node_count                 = 3
  min_node_count             = 2
  max_node_count             = 6
  log_analytics_workspace_id = module.monitoring.log_analytics_workspace_id
  tags                       = local.common_tags
}

module "database" {
  source                         = "../../modules/database_sql"
  environment                    = local.environment
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  unique_suffix                  = random_string.suffix.result
  admin_username                 = var.db_admin_username
  admin_password                 = var.db_admin_password
  database_sku_name              = "S2"
  database_max_size_gb           = 50
  subnet_id_for_private_endpoint = module.networking.data_subnet_id
  tags                           = local.common_tags
}

