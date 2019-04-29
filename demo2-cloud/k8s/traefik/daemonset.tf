resource "kubernetes_daemonset" "example" {
  metadata {
    name = "terraform-example"
    namespace = "something"
    labels {
      test = "MyExampleApp"
    }
  }

  spec {
    selector {
      match_labels {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        namespace = "something"
        labels {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"

          resources{
            limits{
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests{
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}