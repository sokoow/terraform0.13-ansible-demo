data "scaleway_instance_image" "image" {
  architecture = var.scaleway_server_arch
  name         = var.scaleway_server_image
}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_server" "webserver_pool" {

count               = var.node_count
name                = "${var.node_name}-${count.index}"
image               = data.scaleway_instance_image.image.id
ip_id = scaleway_instance_ip.public_ip.id
type                = var.scaleway_server_type
enable_ipv6 = false
tags = [
  "transport", ]

security_group_id = scaleway_instance_security_group.master_security_group.id

connection {
  type = "ssh"
  user = "root"
  private_key = file(var.scaleway_private_key_path)
  host = scaleway_instance_ip.public_ip.address
}
}
