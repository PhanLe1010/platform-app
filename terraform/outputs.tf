output "cluster_name" {
  value = kind_cluster.this.name
}

output "argocd_namespace" {
  value = kubernetes_namespace.argocd.metadata[0].name
}

output "app_namespace" {
  value = kubernetes_namespace.app.metadata[0].name
}

output "argocd_admin_password_command" {
  description = "Run this to get the initial ArgoCD admin password"
  value       = "kubectl -n ${kubernetes_namespace.argocd.metadata[0].name} get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d"
}

output "argocd_port_forward_command" {
  description = "Run this to access the ArgoCD UI"
  value       = "kubectl -n ${kubernetes_namespace.argocd.metadata[0].name} port-forward svc/argocd-server 8443:443"
}