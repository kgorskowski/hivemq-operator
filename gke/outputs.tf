
output "kubernetes_endpoint" {
   value = google_container_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  sensitive   = true
  description = "Cluster ca certificate (base64 encoded)"
  value       = google_container_cluster.this.master_auth.0.cluster_ca_certificate
}
