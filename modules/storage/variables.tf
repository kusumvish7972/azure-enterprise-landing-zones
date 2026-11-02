variable "environment" {
  description = "Target deployment environment (dev, uat, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the storage account resides"
  type        = string
}

variable "unique_suffix" {
  description = "Globally unique alphanumeric string for storage account name (3-12 characters)"
  type        = string
}

variable "replication_type" {
  description = "Data redundancy type (LRS, GRS, ZRS, RAGRS)"
  type        = string
  default     = "GRS"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed"
  type        = bool
  default     = false
}

variable "subnet_id_for_private_endpoint" {
  description = "Subnet ID in which to place the blob Private Endpoint"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

