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

variable "vm_list" {
  description = "List of VM configurations"
  type        = list(any)
}

