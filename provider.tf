terraform {
  required_providers {
    coder = {
      source = "coder/coder"
    }
    scaleway = {
      source = "scaleway/scaleway"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
    }
  }
}

provider "scaleway" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}
