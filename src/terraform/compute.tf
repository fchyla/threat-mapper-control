resource "google_service_account" "threat-mapper" {
  account_id   = "sa-threat-mapper-${random_string.deployment-id.result}"
  display_name = "Service Account for ThreatMapper control plane"
}

resource "google_project_iam_member" "threat-mapper_account_logs" {
  project = var.project
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.threat-mapper.email}"

}

resource "google_project_iam_member" "threat-mapper_account_metrics" {
  project = var.project
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.threat-mapper.email}"

}

resource "google_compute_instance" "threat-mapper" {
  name         = "threat-mapper-control-${random_string.deployment-id.result}"
  machine_type = "n2-standard-4"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 150
    }
  }
  metadata = {
    startup-script = file("templates/startup.sh")
  }

  network_interface {
    subnetwork = google_compute_subnetwork.threat_mapper_subnetwork.id

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.threat-mapper.email
    scopes = ["cloud-platform"]
  }
}
