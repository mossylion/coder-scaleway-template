locals {
  hostname   = lower(data.coder_workspace.me.name)
  linux_user = "coder"
}

data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = false

  boundary = "//"

  part {
    filename     = "cloud-config.yaml"
    content_type = "text/cloud-config"

    content = templatefile("${path.module}/cloud-init/cloud-config.yaml.tftpl", {
      hostname   = local.hostname
      linux_user = local.linux_user
    })
  }

  part {
    filename     = "userdata.sh"
    content_type = "text/x-shellscript"

    content = templatefile("${path.module}/cloud-init/userdata.sh.tftpl", {
      linux_user        = local.linux_user
      init_script       = replace(try(coder_agent.main.init_script, ""), "coder.local.loona.co.uk", "coder.loona.co.uk")
      coder_agent_token = coder_agent.main.token
    })
  }
}
