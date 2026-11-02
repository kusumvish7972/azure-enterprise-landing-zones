# 🗄️ Azure SQL Database Module

Enterprise Terraform child module provisioning an encrypted, audited Azure SQL Database instance with Private Link connectivity.

## Capabilities
- **Zero-Trust Network Access**: Public network access completely disabled; strictly accessible via Private Endpoint in `snet-data`.
- **Encryption at Rest (TDE)**: Transparent Data Encryption enabled by default.
- **Entra ID Authentication**: Azure AD administrator integrated for identity-based RBAC.
- **Transport Security**: Minimum TLS 1.2 enforced on all database client handshakes.

