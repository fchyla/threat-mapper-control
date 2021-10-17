
resource "google_compute_network" "threat_mapper_vpc" {
  name                    = "threat-mapper-vpc-${random_string.deployment-id.result}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "threat_mapper_subnetwork" {
  name          = "threat-mapper-${random_string.deployment-id.result}-subnetwork"
  ip_cidr_range = "10.80.0.0/24"
  region        = "europe-west4"
  network       = google_compute_network.threat_mapper_vpc.id

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}


### Firewall

resource "google_compute_firewall" "threat-mapper-access" {
  name        = "threat-mapper-access-${random_string.deployment-id.result}"
  network     = google_compute_network.threat_mapper_vpc.id
  description = "WebUI and sensor data"

  allow {
    protocol = "tcp"
    ports    = ["443", "8000"]
  }
  source_ranges           = var.whitelisted_ips
  target_service_accounts = [google_service_account.threat-mapper.email]
}

resource "google_compute_firewall" "threat-mapper-iap" {
  name        = "threat-mapper-iap-${random_string.deployment-id.result}"
  network     = google_compute_network.threat_mapper_vpc.id
  description = "WebUI and sensor data"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges           = ["35.235.240.0/20"]
  target_service_accounts = [google_service_account.threat-mapper.email]
}

