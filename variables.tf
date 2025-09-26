variable "project_id" {
  type        = string
  description = "ID of the project to deploy into"
}

variable "access_key" {
  type        = string
  description = "Access key to use to deploy"
}

variable "secret_key" {
  type        = string
  description = "Secret key to use to deploy"
}

variable "region" {
  type        = string
  description = "Region to deploy into"
}
