###########################
### K8S Service - Redis ###
###########################
provider "kubernetes" {
  host                   = "${var.host}"
  username               = "${var.username}"
  password               = "${var.password}"
  client_certificate     = "${base64decode(var.client_certificate)}"
  client_key             = "${base64decode(var.client_key)}"
  cluster_ca_certificate = "${base64decode(var.cluster_ca_certificate)}"
  load_config_file = false
}
resource "kubernetes_service" "tf" {
  metadata {
    name = "tf"

    labels {
      app  = "tf"
      role = "master"
      tier = "backend"
    }
  }

  spec {
    selector {
      app  = "tf"
      role = "master"
      tier = "backend"
    }

    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 80
    }
  }
}

output "ip_tf" {
  value = "${kubernetes_service.tf.load_balancer_ingress.0.ip}"
}