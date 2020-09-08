variable "max_node_count" {
  description = "initial amount of nodes to deploy for the kubernetes cluster"
  default     = "3"
}

variable "cluster_name" {
  description = "Name of Cluster and Node Pool"
  default     = "hivemq"
}

variable "gce_zone" {
    default = "europe-west1-b"
}
