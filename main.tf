variable "private_key_file" {
  description = "name of the private_key_file"
  default     = "id_rsa"
}

resource "random_string" "hostname" {
  length  = 10
  special = false
}

resource "tls_private_key" "temporary" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_sensitive_file" "private_key_pem" {
  content  = tls_private_key.temporary.private_key_pem
  filename = var.private_key_file

  provisioner "local-exec" {
    command = "chmod 600 ${var.private_key_file}"
  }
}

resource "digitalocean_ssh_key" "temporary" {
  name       = "temporary"
  public_key = tls_private_key.temporary.public_key_openssh
}

data "template_cloudinit_config" "droplet-userdata" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = file("${path.module}/cloud-config.txt")
  }
}

# Delay to prevent `invalid key identifiers for Droplet creation` error
resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 10"
  }

  triggers = {
    "before" = digitalocean_ssh_key.temporary.fingerprint
  }
}

resource "digitalocean_droplet" "temporary" {
  image  = "debian-11-x64"
  name   = random_string.hostname.result
  region = "nyc3"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.droplet-userdata.rendered

  ssh_keys   = [digitalocean_ssh_key.temporary.fingerprint]
  depends_on = [null_resource.delay]
}

output "connection_string" {
  description = "Command line string to connect and port forward"
  value       = "ssh -tA -C -D 8140 -i ${var.private_key_file} root@${digitalocean_droplet.temporary.ipv4_address}"
}

output "ipv4_address" {
  description = "The IPv4 address of the temporary server"
  value       = digitalocean_droplet.temporary.ipv4_address
}

output "private_key_file" {
  description = "The filename of the private ssh key"
  value       = var.private_key_file
}

