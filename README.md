# temporary-server

## Setup

- Install terraform

```sh
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_darwin_amd64.zip
unzip terraform_0.11.7_darwin_amd64.zip
mv terraform /usr/local/bin
```

- Set `DIGITALOCEAN_TOKEN` environment variable from a [personal access token](https://cloud.digitalocean.com/account/api/tokens?i=1894d4)

## Running

- Connect to a temporary server with a socks5 proxy port forward on 8140 `./connect.sh`

## Development

- Install pre-commit hooks `brew install pre-commit`
- Install terraform-docs `brew install terraform-docs`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| private\_key\_file | name of the private_key_file | string | `"id_rsa"` | no |

## Outputs

| Name | Description |
|------|-------------|
| connection\_string | Command line string to connect and port forward |
| ipv4\_address | The IPv4 address of the temporary server |
| private\_key\_file | The filename of the private ssh key |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
