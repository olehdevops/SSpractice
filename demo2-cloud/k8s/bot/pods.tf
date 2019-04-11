###############################
### K8S PODs - Telegram Bot ###
###############################
resource "kubernetes_deployment" "telebot" {
  metadata {
    name = "telebot"

    labels {
      app  = "telebot"
      role = "master"
      tier = "backend"
    }
  }

  spec {
    replicas = 1

    selector = {
      match_labels {
        app  = "telebot"
        role = "master"
        tier = "backend"
      }
    }

    template {
      metadata {
        labels {
          app  = "telebot"
          role = "master"
          tier = "backend"
        }
      }

      spec {
        container {
          image = "denizka/telebot:v0.3"
          name  = "master"
          /*env {
            name  = "api_telegram"
            value = "${var.api_telegram}"
          }
          env {
            name  = "ip_redis"
            value = "${kubernetes_service.redis-master.load_balancer_ingress.0.ip}"
          }*/
          resources {
            requests {
              cpu    = "100m"
              memory = "512Mi"
          }}
        }
      }
    }
  }
}