terraform {
  required_version = "0.11.7"
}

variable "private_key_file" {
  default = "id_rsa"
}

resource "tls_private_key" "temporary" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key_pem" {
  content  = "${tls_private_key.temporary.private_key_pem}"
  filename = "${var.private_key_file}"

  provisioner "local-exec" {
    command = "chmod 600 ${var.private_key_file}"
  }
}

resource "digitalocean_ssh_key" "temporary" {
  name       = "temporary"
  public_key = "${tls_private_key.temporary.public_key_openssh}"
}

resource "digitalocean_droplet" "temporary" {
  image  = "ubuntu-18-04-x64"
  name   = "temporary"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = ["${digitalocean_ssh_key.temporary.fingerprint}"]
}

output "connection_string" {
  description = "Command line string to connect and port forward"
  value       = "ssh -tA -C -D 8140 -i ${var.private_key_file} root@${digitalocean_droplet.temporary.ipv4_address}"
}

output "ipv4_address" {
  description = "The IPv4 address of the temporary server"
  value       = "${digitalocean_droplet.temporary.ipv4_address}"
}

output "private_key_file" {
  description = "The filename of the private ssh key"
  value       = "${var.private_key_file}"
}
