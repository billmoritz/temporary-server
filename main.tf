terraform {
  required_version = "0.11.7"
}

provider "digitalocean" {
  version = "~> 1.1"
}

resource "digitalocean_ssh_key" "default" {
  name       = "tempserver default"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "digitalocean_droplet" "tempserver" {
  image  = "ubuntu-18-04-x64"
  name   = "tempserver"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
}

output "connection_string" {
  description = "Command line string to connect and port forward"
  value       = "ssh -tA -C -D 8150 -i ~/.ssh/id_rsa root@${digitalocean_droplet.tempserver.ipv4_address}"
}
