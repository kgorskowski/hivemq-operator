resource "google_container_cluster" "this" {
  timeouts {
    delete = "120m"
  }

  name = var.cluster_name
  location = var.gce_zone

  remove_default_node_pool = true
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary" {
  name = "${var.cluster_name}-primary-node-pool"
  location = var.gce_zone

  cluster = google_container_cluster.this.name
  node_count = 1

  node_config {
    // We use preemptible nodes because they're cheap (for testing purposes). Set this to false if you want consistent performance.
    preemptible = true
    machine_type = "n1-standard-4"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  autoscaling {
    max_node_count = var.max_node_count
    min_node_count = 1
  }

  management {
    auto_upgrade = true
  }
}
