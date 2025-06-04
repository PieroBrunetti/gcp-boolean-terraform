module "compute-engine" {
  source                  = "./modules/compute-engine"
  vm_list                 = var.vm_list
  project_id              = var.project_id
  vm_service_account_name = var.vm_service_account_name
}




