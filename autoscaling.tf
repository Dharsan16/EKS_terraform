resource "kubernetes_horizontal_pod_autoscaler" "app" {
  metadata {
    name = "myapp-hpa"
  }

  spec {
    max_replicas = 5
    min_replicas = 2

    scale_target_ref {
      kind = "Deployment"
      name = kubernetes_deployment.app.metadata[0].name
    }

    target_cpu_utilization_percentage = 70
  }
}
