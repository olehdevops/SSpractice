resource "kubernetes_config_map" "traefik_configmap" {
  metadata {
    name = "traefik-configmap"
    namespace = "${kubernetes_namespace.traefik.metadata.0.name}"
  }
  data {
    traefik.toml = "${file("/home/zambezi/devops/mygit/SSpractice/demo2-cloud/k8s/traefik/confmap.toml")}"
  }
}