output "public_ip" {
  value = scaleway_instance_ip.public_ip.address
}
