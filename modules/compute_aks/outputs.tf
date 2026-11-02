output "aks_cluster_id" {
  description = "The ID of the Azure Kubernetes Cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_cluster_name" {
  description = "The name of the Azure Kubernetes Cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config_raw" {
  description = "Raw Kubernetes configuration string"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "cluster_identity_principal_id" {
  description = "Principal ID of the AKS cluster's managed identity"
  value       = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL for workload identity federation"
  value       = azurerm_kubernetes_cluster.aks.oidc_issuer_url
}

