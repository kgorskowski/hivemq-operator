terraform {}

provider "google" {
  project = var.google_project
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

provider "kubernetes" {
  # The 'alias' makes it possible to configure multiple instances of the same provider
  alias                  = "gke"
  load_config_file       = false
  host                   = module.google-hivemq-cluster.kubernetes_endpoint
  token                  = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(module.google-hivemq-cluster.cluster_ca_certificate)
}

provider "helm" {
  alias = "gke"
  kubernetes {
    load_config_file = false
    host             = module.google-hivemq-cluster.kubernetes_endpoint
    token            = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      module.google-hivemq-cluster.cluster_ca_certificate
    )
  }
}
