## 📌 Infrastructure Change Request (RFC)

### 1. Summary of Changes
- **Module(s) Affected**: [e.g. `modules/networking`, `environments/prod`]
- **Change Type**: [ ] Feature / New Resource  [ ] Security Hardening  [ ] Cost Optimization  [ ] Bugfix

### 2. Architectural Impact & Zero-Trust Verification
- [ ] Network security groups (NSGs) / firewall egress rules reviewed
- [ ] No public IP addresses assigned without architecture sign-off
- [ ] Storage accounts enforce TLS 1.3, HTTPS only, and private endpoints
- [ ] Secrets/Keys managed via Azure Key Vault with RBAC & purge protection

### 3. Verification & CI/CD Checklist
- [ ] `terraform fmt -check -recursive` passed
- [ ] `terraform validate` passed on dev, uat, prod
- [ ] Security scanners (`tfsec`, `checkov`) clean of HIGH/CRITICAL alerts
- [ ] Plan output reviewed for unexpected deletions or state drift

