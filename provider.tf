terraform {
  required_providers {
    coder = {
      source  = "coder/coder"
      version = "~> 2"
    }
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2"
    }
  }
  required_version = ">= 1.0"
}

provider "scaleway" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}
