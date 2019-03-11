#temp-do-server

Run `./connect.sh` to start.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| private\_key\_file |  | string | `"id_rsa"` | no |

## Outputs

| Name | Description |
|------|-------------|
| connection\_string | Command line string to connect and port forward |
| ipv4\_address | The IPv4 address of the temporary server |
| private\_key\_file | The filename of the private ssh key |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
