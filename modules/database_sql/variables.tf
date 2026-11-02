variable "environment" {
  description = "Target deployment environment (dev, uat, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the SQL server resides"
  type        = string
}

variable "unique_suffix" {
  description = "Globally unique string for SQL server DNS name"
  type        = string
}

variable "admin_username" {
  description = "Local administrator username"
  type        = string
  default     = "cloudsqladmin"
}

variable "admin_password" {
  description = "Local administrator password"
  type        = string
  sensitive   = true
}

variable "aad_admin_login_name" {
  description = "Azure Active Directory / Entra ID admin display name or email"
  type        = string
  default     = "azure-cloud-admins"
}

variable "aad_admin_object_id" {
  description = "Azure Active Directory / Entra ID admin group/user object ID"
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "database_sku_name" {
  description = "SKU for Azure SQL Database (e.g. S0, S1, GP_Gen5_2)"
  type        = string
  default     = "S1"
}

variable "database_max_size_gb" {
  description = "Max storage size for Azure SQL Database in GB"
  type        = number
  default     = 50
}

variable "subnet_id_for_private_endpoint" {
  description = "Subnet ID in the Spoke VNet dedicated to Data Private Endpoints"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

