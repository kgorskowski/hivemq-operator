module "google-hivemq-cluster" {
  providers = {
    kubernetes = kubernetes.gke
    helm       = helm.gke
  }
  source         = "./gke"
  cluster_name   = "gke-hivemq"
  max_node_count = var.max_node_count

}

module "hivemq-on-gke" {
  # This needs terraform version 0.13 to work. We use it to wait for the successful creation of the cluster to avoid connection problems with the helm and kubernetes provider
  depends_on       = [module.google-hivemq-cluster]
  source           = "./hivemq"
  chart_version    = "0.6.1"
  create_namespace = false
  namespace        = "default"
  # Here we can specify the alias we defined in the 'provider.tf'
  providers = {
    kubernetes = kubernetes.gke
    helm       = helm.gke
  }
  hivemq_chart_values = [
    "${file("google-hivemq-values.yaml")}"
  ]
  nginx_chart_values = [
    "${file("google-nginx-values.yaml")}"
  ]
  domain = var.domain
}
