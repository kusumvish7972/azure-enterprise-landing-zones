variable "environment" {
  description = "Target deployment environment (dev, uat, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the AKS cluster resides"
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to deploy"
  type        = string
  default     = "1.29.2"
}

variable "subnet_id" {
  description = "Subnet ID in the Spoke VNet dedicated for the AKS nodes and pods"
  type        = string
}

variable "node_vm_size" {
  description = "Virtual Machine size for AKS worker nodes"
  type        = string
  default     = "Standard_D4s_v5"
}

variable "node_count" {
  description = "Initial node count"
  type        = number
  default     = 2
}

variable "min_node_count" {
  description = "Minimum auto-scaling node count"
  type        = number
  default     = 2
}

variable "max_node_count" {
  description = "Maximum auto-scaling node count"
  type        = number
  default     = 5
}

variable "service_cidr" {
  description = "CIDR block for Kubernetes internal services"
  type        = string
  default     = "172.16.0.0/16"
}

variable "dns_service_ip" {
  description = "Internal IP for CoreDNS within service_cidr"
  type        = string
  default     = "172.16.0.10"
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID for Container Insights"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

