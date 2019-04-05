#############################
### Google Cloud Platform ###
#############################
provider "google" {
  project     = "${var.project}"
  region      = "${var.region}"
  credentials = "${file("/home/zambezi/devops/gityura/Demo2/key.json")}"
}
