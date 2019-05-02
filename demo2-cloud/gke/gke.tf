#############################
### Google Cloud Platform ###
#############################
provider "google" {
  project     = "${var.project}"
  region      = "${var.region}"
  credentials = "${file("/home/zambezi/devops/mygit/SSpractice/demo2-cloud/key.json")}"
}
### Reserving External IP ###
resource "google_compute_address" "external" {
  name         = "external"
  address_type = "EXTERNAL"
  region       = "${var.region}"
}
### Output for K8S (Traefik controller) ###
output "external_ip" {
  value     = "${google_compute_address.external.address}"
  sensitive = true
}