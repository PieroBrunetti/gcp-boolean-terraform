module "compute-engine" {
  source                   = "./modules/compute-engine"
  region_name              = var.region_name
  project_id               = var.project_id
  github_user              = var.github_user
  artifact_registry_image  = var.artifact_registry_image
  vm_list                  = jsondecode(file("${path.module}/vm-machines.json"))
}