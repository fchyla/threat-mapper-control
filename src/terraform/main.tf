module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "3.4.0"
  network_name = var.network_name
  project_id   = var.project
  subnets = [
    {
      subnet_name   = "${var.network_name}-subnet"
      subnet_ip     = "10.80.10.0/24"
      subnet_region = var.subnet_region
    }
  ]

}

