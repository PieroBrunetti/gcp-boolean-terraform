module "compute-engine" {
  source                  = "./modules/compute-engine"
  vm_list                 = var.vm_list
  project_id              = var.project_id
  vm_service_account_name = var.vm_service_account_name
}

resource "google_compute_firewall" "allow_http_https" {
  name    = "allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags = ["http", "https", "app-website-instance"]
}





