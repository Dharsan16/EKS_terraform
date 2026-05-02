resource "kubernetes_ingress_v1" "app_ingress" {
  metadata {
    name = "myapp-ingress"

    annotations = {
      "alb.ingress.kubernetes.io/scheme" = "internet-facing"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.app.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
