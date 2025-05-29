##resource "google_service_account" "vm_sa" {
##  account_id   = "vm-service-account"
##  display_name = "Service account for VMs"
##  project = var.project_id
#}

resource "google_compute_instance" "vm" {
  count        = length(var.vm_list)
  name         = var.vm_list[count.index].name
  machine_type = var.vm_list[count.index].machine_type
  zone         = "${var.region_name}-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = var.vm_list[count.index].disk_size
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y docker.io google-cloud-sdk
    gcloud auth configure-docker
    docker run -d ${var.artifact_registry_image}
  EOT

  service_account {
    email  = google_service_account.vm_boolean_sa.email
    scopes = ["cloud-platform"]
  }

  tags = var.vm_list[count.index].tags
}


