variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region_name" {
  description = "GCP Region"
  type        = string
}

variable "github_user" {
  description = "GitHub username"
  type        = string
}

variable "artifact_registry_image" {
  description = "Docker image from Artifact Registry"
  type        = string
}

variable "google_credentials" {
  description = "GCP credentials in JSON format"
  type        = string
  sensitive   = true
}