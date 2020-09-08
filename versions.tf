terraform {
  required_version = ">=0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.37.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 1.3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.13.1"
    }
  }
}
