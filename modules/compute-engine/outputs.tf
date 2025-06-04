output "instance_ips" {
  value = {
    for name, vm in google_compute_instance.vm :
    name => vm.network_interface[0].access_config[0].nat_ip
  }
}


