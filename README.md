<div align="center">

<!-- TOP PROFILE & ARCHITECTURAL LOGO -->
<a href="#-executive-summary--digital-resume">
  <img src="https://raw.githubusercontent.com/kusumvish7972/milkyinfo/main/assets/kv_logo.svg" width="135" height="135" alt="KV Monogram Logo" />
</a>

<!-- EXECUTIVE CORPORATE NETWORK BANNER -->
<img src="https://raw.githubusercontent.com/kusumvish7972/milkyinfo/main/assets/kv_banner.svg" width="100%" alt="KV Enterprise Cloud Architecture Network Banner" />

<br/><br/>

<!-- DYNAMIC TYPING SVG ANIMATION -->
<a href="https://github.com/kusumvish7972">
  <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=700&size=21&duration=3000&pause=1000&color=00E5FF&center=true&vCenter=true&random=false&width=850&height=45&lines=%E2%9A%A1+Enterprise+Cloud+Infrastructure+Platform+%7C+Multi-Tier+Landing+Zones;%F0%9F%9B%A1%EF%B8%8F+Zero-Trust+Security%2C+Private+Endpoints+%26+Hub-Spoke+Topology;%F0%9F%9A%80+Modular+Terraform+Architecture%3A+Child+%26+Parent+Environments;%E2%9A%99%EF%B8%8F+Automated+DevSecOps+CI%2FCD%2C+Checkov%2C+tfsec+%26+Policy+Gates" alt="Typing SVG" />
</a>

<br/>

<!-- REPOSITORY STATUS & TECH BADGES -->
[![Terraform Version](https://img.shields.io/badge/Terraform-%3E%3D1.5.0-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure Provider](https://img.shields.io/badge/AzureRM-v3.90%2B-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
[![Architecture](https://img.shields.io/badge/Architecture-Hub%20%26%20Spoke%20Landing%20Zones-23272D?style=for-the-badge&logo=azuredevops&logoColor=white)](#-modular-architecture-child--parent-modules)
[![Zero Trust](https://img.shields.io/badge/Security-Zero--Trust%20Hardened-critical?style=for-the-badge&logo=microsoft&logoColor=white)](#-zero-trust-security--compliance-matrix)
[![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions%20Passing-2ea44f?style=for-the-badge&logo=github-actions&logoColor=white)](.github/workflows/terraform-ci.yml)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=for-the-badge)](LICENSE)

<br/>

```ansi
 [1;36m[ENTERPRISE CLOUD PLATFORM] [0m  [1;32mClone & Deploy [0m ➔  [1;35mMulti-Environment [Dev, UAT, Prod] [0m ➔  [1;33mCIS Hardened [0m
```

---

### ⚡ Quick Navigation Console
*Click any badge below to jump directly into deployment guides, blueprints, child modules, and production playbooks.*

[![Quickstart](https://img.shields.io/badge/%F0%9F%9A%80_Quickstart_Deploy-0A66C2?style=flat-square&logo=gitbook&logoColor=white)](#-quickstart-clone--deploy-in-5-minutes)
[![Architecture](https://img.shields.io/badge/%F0%9F%8F%97%EF%B8%8F_Modular_Architecture-0078D4?style=flat-square&logo=microsoftazure&logoColor=white)](#-modular-architecture-child--parent-modules)
[![Environments](https://img.shields.io/badge/%F0%9F%8C%8D_Multi--Env_Matrix-00A4EF?style=flat-square&logo=windows&logoColor=white)](#-multi-environment-matrix-dev-uat-prod)
[![Zero-Trust](https://img.shields.io/badge/%F0%9F%9B%A1%EF%B8%8F_Zero--Trust_Security-E81123?style=flat-square&logo=microsoft&logoColor=white)](#-zero-trust-security--compliance-matrix)
[![CI/CD Pipelines](https://img.shields.io/badge/%E2%9A%99%EF%B8%8F_DevSecOps_CI%2FCD-7B42BC?style=flat-square&logo=azuredevops&logoColor=white)](#-devsecops-ci-cd--automated-security-gates)
[![Architect Profile](https://img.shields.io/badge/%F0%9F%91%A9%E2%80%8D%F0%9F%92%BB_Lead_Architect-107C41?style=flat-square&logo=curseforge&logoColor=white)](#-lead-architect--maintainer)

---

</div>

<br/>

## 📖 Overview
This repository provides a **battle-tested, production-ready Infrastructure as Code (IaC) enterprise platform** designed using HashiCorp Terraform and Microsoft Cloud Adoption Framework (CAF) Landing Zones. 

It implements an extensible **Child and Parent Module architecture**, allowing engineers, teams, and organizations to clone this repository and spin up isolated, zero-trust cloud infrastructures across **Development (Dev)**, **Staging (UAT)**, and **Mission-Critical Production (Prod)** with zero manual configuration.

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│                        ENTERPRISE CLOUD ARCHITECTURE TOPOLOGY                          │
├──────────────────────────────┬─────────────────────────────┬───────────────────────────┤
│ 🌐 Hub & Spoke Networking    │ 🔐 Zero-Trust Identity      │ ⚡ Resilient Compute      │
│ Isolated Hub (Firewall, GW)  │ Key Vault (RBAC, Purge Prot)│ AKS with Autoscaling &    │
│ & Spoke (App, AKS, Data)     │ Managed Identity & Secret Rot│ Azure CNI Micro-seg       │
├──────────────────────────────┼─────────────────────────────┼───────────────────────────┤
│ 💾 Enterprise Database       │ 📦 Hardened Storage         │ 📊 SRE Observability      │
│ Azure SQL with TDE, Auditing │ Blob Storage TLS 1.3 only,  │ 24/7 Log Analytics & App  │
│ & Private Link connectivity  │ Versioning & Private Endpt  │ Insights Telemetry Matrix │
└──────────────────────────────┴─────────────────────────────┴───────────────────────────┘
```

---

## 🚀 Quickstart: Clone & Deploy in 5 Minutes

Anyone can clone this repository and provision their own cloud stack immediately:

### 1. Prerequisites
Ensure you have the following installed:
- [Terraform CLI (>= 1.5.0)](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI (az)](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Active Microsoft Azure Subscription

### 2. Authenticate to Azure
```bash
az login
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
```

### 3. Clone Repository
```bash
git clone https://github.com/kusumvish7972/milkyinfo.git
cd milkyinfo
```

### 4. Deploy an Environment (Dev / UAT / Prod)

#### Option A: Deploy Development Environment (`dev`)
```bash
cd environments/dev
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

#### Option B: Deploy Production Environment (`prod`)
```bash
cd environments/prod
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

#### Option C: Quick Automation via Makefile / PowerShell
```bash
# Using Make (Linux/macOS)
make plan ENV=dev
make apply ENV=dev

# Using PowerShell (Windows)
.\scripts\manage.ps1 -Environment dev -Action plan
.\scripts\manage.ps1 -Environment dev -Action apply
```

---

## 🏗️ Modular Architecture (Child & Parent Modules)

The codebase strictly follows industry best practices for modular infrastructure:

```
milkyinfo/
├── .github/
│   ├── workflows/
│   │   ├── terraform-ci.yml       # Automated CI, linting, tfsec & checkov
│   └── pull_request_template.md   # Enterprise PR RFC checklist
├── environments/                  # 🌟 PARENT MODULES (Environment Stacks)
│   ├── dev/                       # Development environment configuration
│   │   ├── main.tf                # Invokes child modules for dev
│   │   ├── variables.tf           # Environment-specific variables
│   │   ├── outputs.tf             # Exposes provisioned endpoints
│   │   ├── providers.tf           # Azurerm provider & backend config
│   │   └── terraform.tfvars.example
│   ├── uat/                       # User Acceptance Testing / Staging
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── providers.tf
│   └── prod/                      # Mission-Critical High Availability Prod
│       ├── main.tf                # Multi-AZ, GRS, Purge Protection
│       ├── variables.tf
│       ├── outputs.tf
│       └── providers.tf
├── modules/                       # 🧩 CHILD MODULES (Reusable Building Blocks)
│   ├── networking/                # Hub & Spoke VNet, Subnets, NSG, Peering
│   ├── security/                  # Azure Key Vault, Managed Identity, Private Link
│   ├── storage/                   # Hardened Storage Account, TLS 1.3, Blobs
│   ├── compute_aks/               # Kubernetes Cluster with Autoscaler & Azure CNI
│   ├── database_sql/              # Azure SQL with TDE, Auditing & Private Endpoints
│   └── monitoring/                # Log Analytics Workspace & App Insights
├── scripts/
│   └── manage.ps1                 # Cross-platform Windows PowerShell automation
├── main.tf                        # Root orchestration entrypoint
├── variables.tf                   # Root input parameters
├── outputs.tf                     # Root output attributes
├── Makefile                       # Unix build automation toolchain
├── .tflint.hcl                    # TFLint configuration for AzureRM
└── LICENSE                        # Apache 2.0 Open Source License
```

---

## 🧩 Child Modules Catalog

| Child Module | Purpose | Key Security & Governance Features |
| :--- | :--- | :--- |
| [`modules/networking`](modules/networking/) | Enterprise Hub-and-Spoke Topology | Isolated subnets (Firewall, App, AKS, Data), Default-Deny NSG, bidirectional peering. |
| [`modules/security`](modules/security/) | Zero-Trust Secrets & Identity | Key Vault with RBAC Authorization, Soft-Delete (90 days), Purge Protection, Private Link. |
| [`modules/storage`](modules/storage/) | Secure Data Lake & Blobs | Minimum TLS 1.2/1.3, public access disabled, blob versioning & retention, private endpoint. |
| [`modules/compute_aks`](modules/compute_aks/) | Production Kubernetes (AKS) | Virtual Machine Scale Sets (VMSS), Azure CNI, managed identity, Container Insights. |
| [`modules/database_sql`](modules/database_sql/) | Enterprise Relational Database | Azure SQL with Transparent Data Encryption (TDE), Entra ID admin, private endpoint. |
| [`modules/monitoring`](modules/monitoring/) | Unified Observability Engine | Log Analytics Workspace, Application Insights, Action Group alerting. |

---

## 🌍 Multi-Environment Matrix (Dev, UAT, Prod)

| Architectural Dimension | 🧪 Development (`dev`) | 🔬 Staging / UAT (`uat`) | 🚀 Production (`prod`) |
| :--- | :--- | :--- | :--- |
| **AKS Worker VM Size** | `Standard_B2s` | `Standard_D4s_v5` | `Standard_D8s_v5` |
| **AKS Node Scalability** | 1 - 3 Nodes | 2 - 6 Nodes | 3 - 12 Nodes (Multi-AZ) |
| **Storage Redundancy** | LRS (Locally Redundant) | ZRS (Zone-Redundant) | GRS (Geo-Redundant) |
| **SQL Database Tier** | Basic / S1 | S2 (50 GB) | GP_Gen5_4 (250 GB) |
| **Log Retention** | 30 Days | 60 Days | 90 Days |
| **Key Vault Purge Prot.** | Disabled (Easy teardown) | Enabled | Enabled (Strict Zero-Trust) |
| **Public IP Exposure** | None (Private Endpoints) | None (Private Endpoints) | None (Zero Public IPs) |

---

## 🛡️ Zero-Trust Security & Compliance Matrix

Every module in this repository adheres to the **CIS Azure Foundations Benchmark** and **PCI-DSS v4.0** standards:

```mermaid
flowchart LR
    classDef client fill:#1e1e2e,stroke:#89b4fa,stroke-width:2px,color:#cdd6f4;
    classDef hub fill:#181825,stroke:#fab387,stroke-width:2px,color:#cdd6f4;
    classDef spoke fill:#11111b,stroke:#a6e3a1,stroke-width:2px,color:#cdd6f4;
    classDef secure fill:#313244,stroke:#f38ba8,stroke-width:2px,color:#cdd6f4;

    Client["🏢 Enterprise Client / VPN"]:::client
    HubVNet["🌐 Hub VNet (10.100.0.0/16)\nAzure Firewall + Gateway"]:::hub
    SpokeVNet["☁️ Spoke VNet (10.200.0.0/16)"]:::spoke

    subgraph SpokeSubnets["Spoke Workload Tiers"]
        AKS["☸️ AKS Cluster (snet-aks)\nPrivate CNI Network"]:::spoke
        App["💻 Application Tier (snet-app)\nNSG Default-Deny"]:::spoke
        Data["🔒 Data Tier (snet-data)\nPrivate Endpoints Only"]:::secure
    end

    KeyVault["🔑 Azure Key Vault\nPrivate Link + RBAC"]:::secure
    SQL["🗄️ Azure SQL Server\nTDE + Private Link"]:::secure
    Storage["📦 Storage Account\nTLS 1.3 + Private Link"]:::secure

    Client ==> HubVNet
    HubVNet <== "Bi-directional Peering" ==> SpokeVNet
    SpokeVNet --> AKS
    SpokeVNet --> App
    AKS -.-> Data
    Data ==> KeyVault
    Data ==> SQL
    Data ==> Storage
```

1. **Micro-Segmentation**: Workloads communicate only across private subnets via dedicated route tables and default-deny NSGs.
2. **Private Link**: All PaaS services (SQL, Key Vault, Storage) disable public IP routing and bind strictly to private endpoints in `snet-data`.
3. **Identity-Driven Governance**: Zero hardcoded credentials. All workloads authenticate using Azure User-Assigned or System-Assigned Managed Identities with Azure Entra ID RBAC.
4. **Data at Rest & in Transit**: TLS 1.3 enforced across all transport layers; Transparent Data Encryption (TDE) active across all databases.

---

## ⚙️ DevSecOps CI/CD & Automated Security Gates

This repository includes fully automated GitHub Actions pipelines located in [`.github/workflows/terraform-ci.yml`](.github/workflows/terraform-ci.yml):

- **Terraform Format Check**: `terraform fmt -check -recursive`
- **Static Syntax Validation**: `terraform validate` across `dev`, `uat`, and `prod` parent environments
- **Security SAST Scanning**: Automated scans via **`tfsec`** for misconfigurations and security flaws
- **Compliance Policy Auditing**: Automated policy scans via **`Bridgecrew Checkov`** enforcing CIS Benchmarks

---

## 👩‍💻 Lead Architect & Maintainer

<div align="center">

### Kusum Vishwakarma
**Principal Enterprise Cloud Architect & DevSecOps Strategist**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect%20with%20Kusum-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/)
[![Email](https://img.shields.io/badge/Direct%20Email-Contact%20Architect-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:gunjankgaurav1994@sanjayjaiswal2395gmail.onmicrosoft.com)
[![GitHub](https://img.shields.io/badge/GitHub-Follow%20@kusumvish7972-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/kusumvish7972)

<br/>

[![Azure Solutions Architect](https://img.shields.io/badge/Microsoft_Certified-Azure_Solutions_Architect_Expert_(AZ--305)-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://learn.microsoft.com/)
[![Azure DevOps Engineer](https://img.shields.io/badge/Microsoft_Certified-Azure_DevOps_Engineer_Expert_(AZ--400)-0089D6?style=for-the-badge&logo=azuredevops&logoColor=white)](https://learn.microsoft.com/)
[![Azure Security Engineer](https://img.shields.io/badge/Microsoft_Certified-Azure_Security_Engineer_(AZ--500)-005A9E?style=for-the-badge&logo=microsoft&logoColor=white)](https://learn.microsoft.com/)
[![Terraform Associate](https://img.shields.io/badge/HashiCorp_Certified-Terraform_Associate_(003)-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.hashicorp.com/)
[![FinOps Certified](https://img.shields.io/badge/FinOps_Foundation-Certified_Practitioner_(FOCP)-107C41?style=for-the-badge&logo=curseforge&logoColor=white)](https://www.finops.org/)
[![CKA](https://img.shields.io/badge/Linux_Foundation-Kubernetes_Administrator_(CKA)-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://www.cncf.io/)

<br/><br/>

<!-- ANIMATED FOOTER WAVE -->
<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2,9,20,38&height=120&section=footer" width="100%" alt="Footer Wave"/>

<sub>Designed & Architected with Enterprise Precision • Apache 2.0 Open Source Platform</sub>

</div>
