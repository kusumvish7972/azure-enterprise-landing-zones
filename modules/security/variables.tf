variable "environment" {
  description = "Target deployment environment (dev, uat, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where security assets reside"
  type        = string
}

variable "unique_suffix" {
  description = "Unique alphanumeric string to ensure global uniqueness for Key Vault"
  type        = string
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled on Key Vault (recommended true for prod)"
  type        = bool
  default     = true
}

variable "enable_public_access" {
  description = "Whether public network access is allowed (recommended false for zero-trust)"
  type        = bool
  default     = false
}

variable "allowed_subnet_ids" {
  description = "List of virtual network subnet IDs authorized for Key Vault access"
  type        = list(string)
  default     = []
}

variable "allowed_ip_rules" {
  description = "List of approved CIDRs/IPs allowed if public endpoint is conditionally active"
  type        = list(string)
  default     = []
}

variable "subnet_id_for_private_endpoint" {
  description = "Subnet ID in which to place the Private Endpoint for Key Vault"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

