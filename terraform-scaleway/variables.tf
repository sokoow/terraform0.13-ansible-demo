variable "cloud_provider" {
  type    = string # can be 'aws', 'hetzner', 'scaleway'
  default = "scaleway"
}

# Common
variable "node_name" {
  type    = string
  default = "transport"
}

variable "node_count" {
  type    = string
  default = "1"
}

variable "ssh_user" {
  type    = string
  default = "root"
}

variable "ip_admin" {
  type = list
  default = [ "0.0.0.0/0" ]
  description = "Firewall rules IPs"
}

variable "private_key" {
  type        = string
  default     = "~/.ssh/id_rsa"
  description = "The path to your private key"
}

# Cloud-specific
## Scaleway
variable "scaleway_server_arch" {
  type    = string
  default = "x86_64"
}

variable "scaleway_server_image" {
  type    = string
  default = "Ubuntu Bionic"
}

variable "scaleway_server_type" {
  type    = string
  default = "DEV1-S"
}

variable "region" {
  type    = string
  default = "nl-ams"
}

variable "zone" {
  type    = string
  default = "nl-ams-1"
}
