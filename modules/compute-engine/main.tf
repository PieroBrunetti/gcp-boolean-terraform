# Crea la cuenta de servicio solo si se especifica un nombre
resource "google_service_account" "vm_sa" {
  count        = var.vm_service_account_name != "" ? 1 : 0
  account_id   = var.vm_service_account_name
  display_name = "VM Service Account"
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
    email  = var.vm_service_account_name != "" ? google_service_account.vm_sa[0].email : null
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    docker-credential-gcr configure-docker
    docker run -d ${each.value.image}
  EOT
}
