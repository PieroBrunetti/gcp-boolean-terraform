variable "project_id" {
  type = string
}

variable "vm_list" {
  type = list(object({
    name         = string
    machine_type = string
    zone         = string
    image        = string
  }))
}

variable "vm_service_account_name" {
  description = "Nombre de la cuenta de servicio para las VMs"
  type        = string
  default     = ""
}

variable "GCP_CREDENTIALS" {
  description = "Contenido del archivo de credenciales GCP en formato JSON (pasado por variable de entorno)"
  type        = string
}
variable "region_name" {
  description = "Región donde se desplegarán los recursos"
  type        = string
}
