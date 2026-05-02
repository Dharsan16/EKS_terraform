resource "kubernetes_deployment" "app" {
  metadata {
    name = "myapp"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "myapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp"
        }
      }

      spec {
        container {
          name  = "myapp"
          image = "nginx"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
