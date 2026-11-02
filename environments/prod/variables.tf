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
  description = "Operational alert receiver email for 24/7 SRE on-call"
  type        = string
  default     = "sre-prod@enterprise.local"
}

variable "db_admin_username" {
  description = "Administrator username for Azure SQL Server"
  type        = string
  default     = "sqlprodadmin"
}

variable "db_admin_password" {
  description = "Administrator password for Azure SQL Server"
  type        = string
  sensitive   = true
  default     = "Pr0dEnterpriseSecureP@ss#2026!"
}

variable "tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}

