variable "vm_list" {
  type = list(object({
    name         = string
    machine_type = string
    zone         = string
    image        = string
  }))
}

variable "project_id" {
  type = string
}

variable "vm_service_account_name" {
  description = "Nombre de la cuenta de servicio para las VMs"
  type        = string
}
