module "compute-engine" {
  source                 = "./modules/compute-engine"
  project_id             = var.project_id
  region_name            = var.region_name
  github_user            = var.github_user
  artifact_registry_image = var.artifact_registry_image
  vm_list                = var.vm_list
}
