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
/*
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
}*/

module "mongo" {
  source                 = "./k8s/mongo"
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

module "redis" {
  source                 = "./k8s/redis"
  host                   = "${module.gke.host}"
  username               = "${var.username}"
  password               = "${var.password}"
  client_certificate     = "${module.gke.client_certificate}"
  client_key             = "${module.gke.client_key}"
  cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
}

module "tf" {
  source                 = "./k8s/tensorflow"
  host                   = "${module.gke.host}"
  username               = "${var.username}"
  password               = "${var.password}"
  client_certificate     = "${module.gke.client_certificate}"
  client_key             = "${module.gke.client_key}"
  cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
}

module "jypiter" {
  source                 = "./k8s/jypiter"
  host                   = "${module.gke.host}"
  username               = "${var.username}"
  password               = "${var.password}"
  client_certificate     = "${module.gke.client_certificate}"
  client_key             = "${module.gke.client_key}"
  cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
  lbmainip = "${module.gke.mainip}"
}

module "bot" {
  source                 = "./k8s/bot"
  host                   = "${module.gke.host}"
  username               = "${var.username}"
  password               = "${var.password}"
  client_certificate     = "${module.gke.client_certificate}"
  client_key             = "${module.gke.client_key}"
  cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
  api_telegram           = "${var.api_telegram}"
  #ip_redis              = "${module.redis.ip_redis}"
}
module "functions" {
  project               = "${var.project}"
  source                = "./functions"
  region                = "${var.region}"
  bucket                = "${var.bucket}"
  API                   = "${var.API}"
  #service               = "${module.mongo.ip}"
  #ip_redis              = "${module.redis.ip_redis}"
  #ip_tf = "${module.tf.ip_tf}"
  MONGODB_PASSWORD      = "${var.MONGODB_PASSWORD}"
  MONGODB_ROOT_PASSWORD = "${var.MONGODB_ROOT_PASSWORD}"
}
