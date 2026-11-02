variable "environment" {
  description = "Target deployment environment (dev, uat, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name identifier prefix"
  type        = string
  default     = "cloudstack"
}

variable "location" {
  description = "Target Azure Region"
  type        = string
  default     = "eastus"
}

variable "owner" {
  description = "Engineering Owner / Lead Architect"
  type        = string
  default     = "Kusum Vishwakarma"
}

variable "alert_email_address" {
  description = "Operational on-call alert email"
  type        = string
  default     = "devops-alerts@enterprise.local"
}

variable "log_retention_days" {
  description = "Retention period for Log Analytics Workspace (in days)"
  type        = number
  default     = 30
}

# Network CIDRs
variable "hub_address_space" {
  type        = string
  default     = "10.10.0.0/16"
}

variable "firewall_subnet_prefix" {
  type        = string
  default     = "10.10.1.0/24"
}

variable "gateway_subnet_prefix" {
  type        = string
  default     = "10.10.2.0/24"
}

variable "spoke_address_space" {
  type        = string
  default     = "10.20.0.0/16"
}

variable "app_subnet_prefix" {
  type        = string
  default     = "10.20.1.0/24"
}

variable "aks_subnet_prefix" {
  type        = string
  default     = "10.20.2.0/23"
}

variable "data_subnet_prefix" {
  type        = string
  default     = "10.20.4.0/24"
}

# AKS Settings
variable "aks_node_vm_size" {
  type        = string
  default     = "Standard_D2s_v5"
}

variable "aks_node_count" {
  type        = number
  default     = 2
}

variable "aks_min_node_count" {
  type        = number
  default     = 1
}

variable "aks_max_node_count" {
  type        = number
  default     = 5
}

# Database Settings
variable "db_admin_username" {
  type        = string
  default     = "sqladminuser"
}

variable "db_admin_password" {
  type        = string
  sensitive   = true
  default     = "SuperP@ssw0rd2026!#Dev"
}

variable "db_sku_name" {
  type        = string
  default     = "S1"
}

variable "db_max_size_gb" {
  type        = number
  default     = 20
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

