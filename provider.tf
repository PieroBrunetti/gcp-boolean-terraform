provider "google" {
  credentials = var.GCP_CREDENTIALS
  project     = var.project_id
  region      = var.region_name
}
