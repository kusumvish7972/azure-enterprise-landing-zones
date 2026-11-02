# ☸️ Azure Kubernetes Service (AKS) Module

Enterprise Terraform child module provisioning an auto-scaling, production-hardened Azure Kubernetes Service (AKS) cluster.

## Capabilities
- **Managed Identity**: Uses cloud-native Azure Entra ID managed identities with zero static credentials.
- **Auto-scaler**: Virtual Machine Scale Sets (VMSS) with configurable minimum and maximum node capacity.
- **Azure CNI Networking**: Native high-performance pod networking within virtual network subnets.
- **Azure Monitor Integration**: Container Insights enabled with Log Analytics ingestion.
- **Azure Key Vault Secrets Provider**: Integrated CSI secrets driver with automated rotation.

