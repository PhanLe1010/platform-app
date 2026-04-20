variable "cluster_name" {
  description = "Name of the local kind cluster"
  type        = string
  default     = "platform"
}

variable "app_namespace" {
  description = "Namespace where the application will run"
  type        = string
  default     = "platform-app"
}

variable "argocd_namespace" {
  description = "Namespace for ArgoCD"
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "ArgoCD Helm chart version"
  type        = string
  default     = "5.51.6"
}

variable "gitops_repo_url" {
  description = "URL of the gitops repo ArgoCD will watch"
  type        = string
}

variable "gitops_target_revision" {
  description = "Branch or tag of the gitops repo"
  type        = string
  default     = "main"
}

variable "environment" {
  description = "Environment name (staging, prod)"
  type        = string
  default     = "staging"
}