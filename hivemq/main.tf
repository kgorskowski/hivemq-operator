resource "helm_release" "nginx-ingress" {
  name = "nginx-ingress"
  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart = "nginx-ingress"
  values = var.nginx_chart_values
}
resource "helm_release" "hivemq-operator" {
  name       = "hivemq-operator"
  version    = var.chart_version
  repository = "https://hivemq.github.io/helm-charts"
  chart      = "hivemq-operator"
  values =  var.hivemq_chart_values
}

resource "kubernetes_ingress" "hivemq-cc" {
  metadata {
    name = "hivemq-cc"
    annotations = {
      "nginx.ingress.kubernetes.io/affinity"      = "cookie"
      "nginx.ingress.kubernetes.io/affinity-mode" = "persistent"
    }
  }

  spec {
    backend {
      service_name = "hivemq-hivemq-operator-cc"
      service_port = 8080
    }

    rule {
      host = "hivemq.${var.domain}"
      http {
        path {
          backend {
            service_name = "hivemq-hivemq-operator-cc"
            service_port = 8080
          }
          path = "/"
        }
      }
    }
  }
}

resource "kubernetes_ingress" "hivemq-grafana" {
  metadata {
    name = "hivemq-grafana"
    annotations = {
      "nginx.ingress.kubernetes.io/affinity"      = "cookie"
      "nginx.ingress.kubernetes.io/affinity-mode" = "persistent"
    }
  }
  spec {
    backend {
      service_name = "hivemq-operator-grafana"
      service_port = 80
    }
    rule {
      host = "grafana.${var.domain}"
      http {
        path {
          backend {
            service_name = "hivemq-operator-grafana"
            service_port = 80
          }
          path = "/*"
        }
      }
    }
  }
}
