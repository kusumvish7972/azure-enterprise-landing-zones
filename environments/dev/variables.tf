variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
  default     = "cloudstack"
}

variable "location" {
  description = "Target Azure region"
  type        = string
  default     = "eastus"
}

variable "owner" {
  description = "Owner name or team"
  type        = string
  default     = "Kusum Vishwakarma"
}

variable "alert_email_address" {
  description = "Operational alert receiver email"
  type        = string
  default     = "alerts@enterprise.local"
}

variable "db_admin_username" {
  description = "Administrator username for Azure SQL Server"
  type        = string
  default     = "sqladminuser"
}

variable "db_admin_password" {
  description = "Administrator password for Azure SQL Server"
  type        = string
  sensitive   = true
  default     = "SuperP@ssw0rd2026!#Dev"
}

variable "tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}

