variable "environment" {
  description = "Target deployment environment (dev, uat, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where monitoring resources reside"
  type        = string
}

variable "retention_in_days" {
  description = "Log retention in days (minimum 30)"
  type        = number
  default     = 30
}

variable "alert_email_address" {
  description = "Primary operational email for alerts"
  type        = string
  default     = "operations@enterprise-cloud.local"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

