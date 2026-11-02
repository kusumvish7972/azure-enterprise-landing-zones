# 🔐 Azure Security & Identity Module

Child module implementing zero-trust identity and secret management baselines.

## Capabilities
- **Azure Key Vault**: Configured with Azure RBAC authorization, soft-delete (90 days), and purge protection.
- **Private Link / Private Endpoints**: Isolates vault communication from public internet routes.
- **User Assigned Managed Identity**: Cloud-native passwordless authentication for VMs and microservices.
- **Network ACLs**: Strict default-deny rule on inbound requests.

