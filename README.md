## Requirements

terraform version >= 0.13 required to use the "depends_on" feature on modules.
A project on the Google Cloud with enabled Kubernetes API and a shell logged in (`gcloud login`) with sufficient access permissions on the project to create the necessary resources.


## Providers

| Name | Version |
|------|---------|
| terraform | >=0.13 |
| google | ~> 3.37.0 |
| helm | ~> 1.3.0 |
| kubernetes | ~> 1.13.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain | domain which will used for Kubernetes ingress entries | `string` | `"google-test.com"` | no |
| google\_project | The terraform google provider needs a google project to create the resources | `string` | n/a | yes |
| max\_node\_count | max number of worker nodes to spin up for the kubernetes cluster | `string` | `"3"` | no |

## Outputs

No output.

