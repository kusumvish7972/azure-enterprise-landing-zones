variable "environment" {
  description = "Target deployment environment (dev, uat, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for networking components"
  type        = string
}

variable "hub_address_space" {
  description = "Address space for the Hub VNet"
  type        = string
  default     = "10.100.0.0/16"
}

variable "firewall_subnet_prefix" {
  description = "Address prefix for AzureFirewallSubnet"
  type        = string
  default     = "10.100.1.0/24"
}

variable "gateway_subnet_prefix" {
  description = "Address prefix for GatewaySubnet"
  type        = string
  default     = "10.100.2.0/24"
}

variable "spoke_address_space" {
  description = "Address space for the Spoke VNet"
  type        = string
  default     = "10.110.0.0/16"
}

variable "app_subnet_prefix" {
  description = "Address prefix for application tier"
  type        = string
  default     = "10.110.1.0/24"
}

variable "aks_subnet_prefix" {
  description = "Address prefix for AKS cluster tier"
  type        = string
  default     = "10.110.2.0/23"
}

variable "data_subnet_prefix" {
  description = "Address prefix for database/data tier"
  type        = string
  default     = "10.110.4.0/24"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

