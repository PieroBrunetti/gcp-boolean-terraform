variable "project_id" {
  description = "ID del proyecto GCP"
  type        = string
}

variable "region_name" {
  description = "Región para los recursos"
  type        = string
}

variable "github_user" {
  description = "Usuario GitHub para imagen del container"
  type        = string
}

variable "artifact_registry_image" {
  description = "Nombre de la imagen en Artifact Registry"
  type        = string
}

variable "vm_list" {
  description = "Lista de máquinas virtuales a crear"
  type = list(object({
    name         = string
    machine_type = string
    zone         = string
    image        = string
  }))
}
