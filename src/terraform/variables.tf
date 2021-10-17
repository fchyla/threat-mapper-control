variable "project" {
  description = "Google Cloud project name"
}
variable "network_name" {
  description = "Name for the VPC network"
}
variable "subnet_region" {
  description = "Region for the subnet where ThreatMapper will be deployed"
}
variable "zone" {
  description = "Zone for the ThreatMapper control node, must be in the subnet_region"
}
variable "whitelisted_ips" {
  description = "IPs allowed to connect to the management plane"
  default = []
}
