## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain | domain which will used for Kubernetes ingress entries | `string` | `"google-test.com"` | no |
| google\_project | The terraform google provider needs a google project to create the resources | `string` | n/a | yes |
| max\_node\_count | max number of worker nodes to spin up for the kubernetes cluster | `string` | `"3"` | no |

## Outputs

No output.

