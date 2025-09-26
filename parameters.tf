data "coder_parameter" "base_image" {
  name        = "Image"
  description = "Which base image would you like to use?"
  type        = "string"
  form_type   = "radio"
  default     = "debian_trixie"

  option {
    name  = "Debian 13 (Trixie)"
    value = "debian_trixie"
    icon  = "/icon/debian.svg"
  }

  option {
    name  = "Debian 12 (Bookworm)"
    value = "debian_bookworm"
    icon  = "/icon/debian.svg"
  }

  option {
    name  = "Ubutun 24.04 (Noble)"
    value = "ubuntu_noble"
    icon  = "/icon/fedora.svg"
  }

  option {
    name  = "Fedora 41"
    value = "fedora_41"
    icon  = "/icon/fedora.svg"
  }
}

data "coder_parameter" "disk_size" {
  name      = "Disk Size"
  type      = "number"
  form_type = "slider"
  default   = "10"
  order     = 8
  validation {
    min       = 10
    max       = 50
    monotonic = "increasing"
  }
}

data "coder_parameter" "instance_size" {
  name = "Instance Size"


  option {
    name        = "STARDUST1-S"
    value       = "STARDUST1-S"
    description = "1 CPU, 1GB RAM"
  }

  option {
    name        = "DEV1-S"
    value       = "DEV1-S"
    description = "2 CPU, 2GB RAM"
  }
}


data "coder_parameter" "volume_iops" {
  name        = "Volume IOPS"
  description = "IOPS to provision for disk"
  type        = "number"
  default     = 5000
  option {
    name  = "5000"
    value = 5000
  }
  option {
    name  = "15000"
    value = 15000
  }
}
