terraform {
  backend "gcs" {
    bucket = "curso-devops-terraform-state"
    prefix = "terraform/state"
  }
}
