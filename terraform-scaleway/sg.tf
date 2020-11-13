resource "scaleway_instance_security_group" "master_security_group" {
  inbound_default_policy  = "accept"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port = "25"
  }

  inbound_rule {
    action = "accept"
    port = "22"
  }

  inbound_rule {
    action = "accept"
    protocol = "UDP"
    port = "636"
  }

  inbound_rule {
    action = "accept"
    protocol = "TCP"
    port = "636"
  }

  inbound_rule {
    action = "accept"
    protocol = "TCP"
    port = "6443"
  }

  inbound_rule {
    action = "drop"
    protocol = "ICMP"
    ip = "0.0.0.0"
  }
}
