# Platform infrastructure

Bootstraps a local kind cluster with ArgoCD and registers the
platform-app Application for GitOps-based deployment.

## Prerequisites

- docker
- kind
- kubectl
- terraform >= 1.5
- helm

## Usage

```bash
terraform init
terraform plan -var="gitops_repo_url=https://github.com/YOUR_USER/platform-gitops"
terraform apply -var="gitops_repo_url=https://github.com/YOUR_USER/platform-gitops"
```

## Accessing ArgoCD

```bash
$(terraform output -raw argocd_port_forward_command)
# Open https://localhost:8443
# Username: admin
# Password: $(terraform output -raw argocd_admin_password_command | bash)
```

## Teardown

```bash
terraform destroy
```