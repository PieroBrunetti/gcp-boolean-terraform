output "service_account_email" {
  value = google_service_account.vm_boolean_sa.email
  description = "Email de la cuenta de servicio creada para las VMs"
}

output "vm_names" {
  value = [for vm in google_compute_instance.vm : vm.name]
  description = "Lista de nombres de las instancias VM creadas"
}


