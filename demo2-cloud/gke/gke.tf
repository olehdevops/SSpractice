#############################
### Google Cloud Platform ###
#############################
provider "google" {
  project     = "${var.project}"
  region      = "${var.region}"
  credentials = "${file("/home/zambezi/devops/mygit/SSpractice/demo2-cloud/key.json")}"
}

resource "google_compute_address" "external" {
  name         = "external"
  address_type = "EXTERNAL"
  region       = "${var.region}"
}

output "mainip" {
  value     = "${google_compute_address.external.address}"
  sensitive = true
}