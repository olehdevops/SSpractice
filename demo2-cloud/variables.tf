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

#variable "api_telegram" {}

variable "bucket" {
  description = "my bucket"
}

variable "API" {
  description = "API Key"
}
