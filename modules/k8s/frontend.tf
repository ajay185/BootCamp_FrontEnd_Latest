resource "kubernetes_deployment" "frontend-deployment" {
  metadata {
    name = "cloud-ninja-frontend"
    labels = {
      App = "frontend"
    }
    namespace = "kubernetes-aks1"
  }

  spec {
    replicas                  = 3
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "cloud-ninja-frontend"
      }
    }
    template {
      metadata {
        labels = {
          App = "cloud-ninja-frontend"
        }
      }
      spec {
        container {
          image = "ajay185/frontend:tagversion"
          name  = "cloud-ninja-frontend"
          env {
            name = "SERVER"
            value = "http://cloud-ninja-backend"
          }
          port {
            container_port = 8081
          }

          resources {
            limits = {
              cpu    = "0.2"
              memory = "2562Mi"
            }
            requests = {
              cpu    = "0.1"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}