# install a package on created nodes
resource "null_resource" "bootstrap" {

  count = var.node_count

  connection {
    host = scaleway_instance_ip.public_ip.address
    user = var.ssh_user
    private_key = file(var.private_key)
  }

  provisioner "file" {
    source = "scripts/"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh"
    ]
  }
}

#resource "null_resource" "ansible" {

#  depends_on = [ null_resource.bootstrap, scaleway_instance_server.webserver_pool, ]
#  count = 1

#  connection {
#    host = scaleway_instance_ip.public_ip.address
#    user = var.ssh_user
#    private_key = file(var.private_key)
#  }

#  provisioner "local-exec" {
#    command = "../bin/deploy-ansible-playbook.sh"
#    on_failure = continue
#  }
#}
