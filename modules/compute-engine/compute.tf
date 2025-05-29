resource "google_service_account" "vm_boolean_sa" {
  account_id   = "vm-service-account"
  display_name = "VM Boolean Service Account"
  project      = var.project_id
}

resource "google_compute_instance" "vm" {
  for_each = { for vm in var.vm_list : vm.name => vm }

  name         = each.key
  machine_type = each.value.machine_type
  zone         = each.value.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }

  service_account {
    email  = google_service_account.vm_boolean_sa.email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    docker-credential-gcr configure-docker
    docker run -d gcr.io/${var.project_id}/${var.github_user}/${var.artifact_registry_image}
  EOT
}
