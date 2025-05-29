output "instance_ips" {
  description = "Public IPs of the created VMs"
  value = [
    for instance in google_compute_instance.vm : instance.network_interface[0].access_config[0].nat_ip
  ]
}

