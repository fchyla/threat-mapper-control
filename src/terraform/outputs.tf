output "webui" {
  description = "URL of the webUI"
  value       = "https://${google_compute_instance.threat-mapper.network_interface.0.access_config.0.nat_ip}"
}

output "ssh" {
  description = "ssh connection via IAP"
  value       = "gcloud compute ssh ${google_compute_instance.threat-mapper.name} --tunnel-through-iap"
}
