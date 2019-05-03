variable "bucket" {
  description = "my bucket"
//  export TF_VAR_bucket=api_app
}

variable "project" {
  description = "my project"
//  export TF_VAR_project=your project ID
}

variable "API" {
  description = "API Key"
//  export TF_VAR_API=your API key
}

variable "ip_mongo" {
  description = "service IP address"
  #default = "0.0.0.0"
}
variable "ip_redis" {
  description = "redis IP"
  #default = "0.0.0.0"
}
variable "REDIS_PASSWORD" {
  
}


variable "region" {
  default = "europe-west1"

}

variable "MONGODB_DATABASE" {
  default = "mysinoptik"
}

variable "MONGODB_USERNAME" {
  default = "main_admin"
}

variable "MONGODB_PASSWORD" {}
variable "MONGODB_ROOT_PASSWORD" {}
variable "ip_tf" {}

