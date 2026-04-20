resource "kubernetes_namespace" "app" {
  depends_on = [kind_cluster.this]

  metadata {
    name = var.app_namespace
    labels = {
      "managed-by"  = "terraform"
      "environment" = var.environment
    }
  }
}