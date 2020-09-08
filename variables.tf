variable "max_node_count" {
  description = "max number of worker nodes to spin up for the kubernetes cluster"
  default     = "3"
}
variable "google_project" {
  type        = string
  description = "The terraform google provider needs a google project to create the resources"
}

variable "domain" {
  type        = string
  description = "domain which will used for Kubernetes ingress entries"
  default     = "google-test.com"
}
