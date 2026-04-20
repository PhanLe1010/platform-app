resource "kubernetes_manifest" "platform_app" {
  depends_on = [helm_release.argocd, kubernetes_namespace.app]

  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"

    metadata = {
      name      = "platform-app"
      namespace = kubernetes_namespace.argocd.metadata[0].name
      labels = {
        "managed-by" = "terraform"
      }
    }

    spec = {
      project = "default"

      source = {
        repoURL        = var.gitops_repo_url
        targetRevision = var.gitops_target_revision
        path           = "apps/platform-app/overlays/${var.environment}"
      }

      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = var.app_namespace
      }

      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
        syncOptions = [
          "CreateNamespace=false"
        ]
      }
    }
  }
}