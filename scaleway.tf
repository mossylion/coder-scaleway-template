resource "scaleway_instance_server" "web" {
  type       = var.instance_size
  image      = var.image
  ip_ids     = [scaleway_instance_ip.server_ip.id, scaleway_instance_ip.v4_server_ip.id]
  project_id = data.scaleway_account_project.main.project_id
  state      = data.coder_workspace.me.transition == "start" ? "started" : "stopped"
  user_data = {
    cloud-init = data.cloudinit_config.user_data.rendered
  }
  root_volume {
    size_in_gb  = var.instance_size
    volume_type = "l_ssd"
  }
}


resource "scaleway_instance_ip" "server_ip" {
  type       = "routed_ipv6"
  project_id = data.scaleway_account_project.main.project_id
}

resource "scaleway_instance_ip" "v4_server_ip" {
  type       = "routed_ipv4"
  project_id = data.scaleway_account_project.main.project_id
}
