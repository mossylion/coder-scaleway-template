resource "scaleway_instance_server" "web" {
  name       = data.coder_workspace.me.name
  type       = data.coder_parameter.instance_size.value
  image      = data.coder_parameter.base_image.value
  ip_ids     = [scaleway_instance_ip.server_ip.id, scaleway_instance_ip.v4_server_ip.id]
  project_id = var.project_id
  state      = data.coder_workspace.me.transition == "start" ? "started" : "stopped"
  user_data = {
    cloud-init = data.cloudinit_config.user_data.rendered
  }
  root_volume {
    volume_id = scaleway_block_volume.root_block_volume.id
  }
}

resource "scaleway_block_volume" "root_block_volume" {
  iops       = data.coder_parameter.volume_iops.value
  name       = "some-volume-name"
  size_in_gb = data.coder_parameter.disk_size.value
  project_id = var.project_id
}

resource "scaleway_instance_ip" "server_ip" {
  type       = "routed_ipv6"
  project_id = var.project_id
}

resource "scaleway_instance_ip" "v4_server_ip" {
  type       = "routed_ipv4"
  project_id = var.project_id
}
