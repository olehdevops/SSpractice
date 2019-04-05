#################
### Variables ###
#################
variable "username" {
  default = "admin"
}

variable "password" {}

variable "MONGODB_DATABASE" {
  default = "mysinoptik"
}

variable "MONGODB_USERNAME" {
  default = "main_admin"
}

variable "MONGODB_PASSWORD" {}
variable "MONGODB_ROOT_PASSWORD" {}

variable "project" {}

variable "region" {
  default = "europe-west1"

}

variable "bucket" {
  description = "my bucket"
//  export TF_VAR_bucket=api_app
}

variable "API" {
  description = "API Key"
//  export TF_VAR_API=688bc3704f60250be00b93ccbdbf7c9b
}

###############
### Modules ###
###############
module "gke" {
  source   = "./gke"
  project  = "${var.project}"
  region   = "${var.region}"
  username = "${var.username}"
  password = "${var.password}"
}

module "k8s" {
  source                 = "./k8s"
  host                   = "${module.gke.host}"
  username               = "${var.username}"
  password               = "${var.password}"
  MONGODB_DATABASE       = "${var.MONGODB_DATABASE}"
  MONGODB_USERNAME       = "${var.MONGODB_USERNAME}"
  MONGODB_PASSWORD       = "${var.MONGODB_PASSWORD}"
  MONGODB_ROOT_PASSWORD  = "${var.MONGODB_ROOT_PASSWORD}"
  client_certificate     = "${module.gke.client_certificate}"
  client_key             = "${module.gke.client_key}"
  cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
}


module "functions" {
  project  = "${var.project}"
  source = "./functions"
  region = "${var.region}"
  bucket = "${var.bucket}"
  API = "${var.API}"
  service = "${module.k8s.ip}"
  ip_redis = "${module.k8s.ip_redis}"
  MONGODB_PASSWORD = "${var.MONGODB_PASSWORD}"
  MONGODB_ROOT_PASSWORD = "${var.MONGODB_ROOT_PASSWORD}"
}
