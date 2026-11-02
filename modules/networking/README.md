# 🌐 Azure Hub & Spoke Networking Module

Modular Terraform child module provisioning an enterprise-grade Hub-and-Spoke topology with strict network segmentation and zero-trust NSG guardrails.

## Features
- **Hub Virtual Network**: Pre-allocated subnets for Azure Firewall and VPN/ExpressRoute Gateways.
- **Spoke Virtual Network**: Subnet isolation for Application, Kubernetes (AKS), and Data/Database tiers.
- **Bidirectional VNet Peering**: Low-latency mesh connection between Hub and Spoke.
- **Micro-segmentation NSG**: Default `Deny-All` inbound rule with explicit TLS 443 allows.

## Usage

```hcl
module "networking" {
  source              = "../../modules/networking"
  environment         = "dev"
  location            = "eastus2"
  resource_group_name = "rg-enterprise-network-dev"

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}
```

