################
### K8S PODs ###
################

resource "kubernetes_deployment" "mongo-master" {
  metadata {
    name = "mongo-master"

    labels {
      app  = "mongo"
      role = "master"
      tier = "backend"
    }
  }

  spec {
    replicas = 1

    selector = {
      match_labels {
        app  = "mongo"
        role = "master"
        tier = "backend"
      }
    }

    template {
      metadata {
        labels {
          app  = "mongo"
          role = "master"
          tier = "backend"
        }
      }

      spec {
        container {
          image = "bitnami/mongodb:latest"
          name  = "master"

          port {
            container_port = 27017
          }

          env {
            name  = "MONGODB_DATABASE"
            value = "${var.MONGODB_DATABASE}"
          }

          env {
            name  = "MONGODB_USERNAME"
            value = "${var.MONGODB_USERNAME}"
          }

          env {
            name  = "MONGODB_PASSWORD"
            value = "${var.MONGODB_PASSWORD}"
          }

          env {
            name  = "MONGODB_ROOT_PASSWORD"
            value = "${var.MONGODB_ROOT_PASSWORD}"
          }

          resources {
            requests {
              cpu    = "100m"
              memory = "100Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "redis-master" {
  metadata {
    name = "redis-master"

    labels {
      app  = "redis"
      role = "master"
      tier = "backend"
    }
  }

  spec {
    replicas = 1

    selector = {
      match_labels {
        app  = "redis"
        role = "master"
        tier = "backend"
      }
    }

    template {
      metadata {
        labels {
          app  = "redis"
          role = "master"
          tier = "backend"
        }
      }

      spec {
        container {
          image = "k8s.gcr.io/redis:e2e"
          name  = "master"

          port {
            container_port = 6379
          }

          resources {
            requests {
              cpu    = "100m"
              memory = "100Mi"
            }
          }
        }
      }
    }
  }
}

/*
resource "kubernetes_replication_controller" "mongo-slave" {
  metadata {
    name = "mongo-slave"

    labels {
      app  = "mongo"
      role = "slave"
      tier = "backend"
    }
  }

  spec {
    replicas = 2

    selector = {
      app  = "mongo"
      role = "slave"
      tier = "backend"
    }

    template {
      container {
        image = "bitnami/mongodb:latest"
        name  = "slave"

        port {
          container_port = 27017
        }

        env {
          name  = "GET_HOSTS_FROM"
          value = "dns"
        }

        resources {
          requests {
            cpu    = "100m"
            memory = "100Mi"
          }
        }
      }
    }
  }
}

resource "kubernetes_replication_controller" "frontend" {
  metadata {
    name = "frontend"

    labels {
      app  = "mongodb"
      tier = "frontend"
    }
  }

  spec {
    replicas = 3

    selector = {
      app  = "mongodb"
      tier = "frontend"
    }

    template {
      container {
        image = "bitnami/mongodb:latest"
        name  = "slave-2"

        port {
          container_port = 27017
        }

        env {
          name  = "GET_HOSTS_FROM"
          value = "dns"
        }

        resources {
          requests {
            cpu    = "100m"
            memory = "100Mi"
          }
        }
      }
    }
  }
}
*/

