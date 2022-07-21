# temporary-server

## Setup

- Install terraform with either [tfenv](https://github.com/tfutils/tfenv) or [tfswitcher](https://warrensbox.github.io/terraform-switcher/)
- Set `DIGITALOCEAN_TOKEN` environment variable from a [personal access token](https://cloud.digitalocean.com/account/api/tokens?i=1894d4)

## Running

- Connect to a temporary server with a socks5 proxy port forward on 8140 `./connect.sh`

## Development

- Install pre-commit hooks `brew install pre-commit`
- Install terraform-docs `brew install terraform-docs`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.21.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.3 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_droplet.temporary](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet) | resource |
| [digitalocean_ssh_key.temporary](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/ssh_key) | resource |
| [local_sensitive_file.private_key_pem](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [null_resource.delay](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_string.hostname](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [tls_private_key.temporary](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [template_cloudinit_config.droplet-userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_key_file"></a> [private\_key\_file](#input\_private\_key\_file) | name of the private\_key\_file | `string` | `"id_rsa"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | Command line string to connect and port forward |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | The IPv4 address of the temporary server |
| <a name="output_private_key_file"></a> [private\_key\_file](#output\_private\_key\_file) | The filename of the private ssh key |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
