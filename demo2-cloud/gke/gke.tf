#############################
### Google Cloud Platform ###
#############################
provider "google" {
  project     = "${var.project}"
  region      = "${var.region}"
  credentials = "${file("/home/zambezi/devops/mygit/SSpractice/demo2-cloud/key.json")}"
}
/*
resource "google_compute_address" "jdefault" {
  name         = "jypiter-ip"
  address_type = "EXTERNAL"
  region       = "${var.region}"
}

output "jypiter_ip" {
  value     = "${google_compute_address.jdefault.address}"
  sensitive = true
}*/