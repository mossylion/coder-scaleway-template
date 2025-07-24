variable "project_name" {
  default     = "default"
  type        = string
  description = "Name of the project to deploy into"
}

variable "instance_size" {
  #default = "STARDUST1-S"
  default     = "DEV1-S"
  description = "Instance size to use"
}

variable "image" {
  default     = "debian_bookworm"
  description = "Image option to use"
}

variable "volume_size" {
  default     = 10
  description = "Size of the disk given to users"
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
