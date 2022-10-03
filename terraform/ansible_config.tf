# Save variables to local-file
resource "local_file" "default_variables" {
  filename = "../ansible/vars/default.yml"
  content  = <<EOT
---
# Nginx
nginx: "${openstack_compute_instance_v2.nginx.access_ip_v4}"

# RMC new machine
rmc: "${openstack_compute_instance_v2.rmc.access_ip_v4}"

  EOT
}

# Create inventory file
resource "local_file" "nginx_ip" {
  filename = "../ansible/inventory"
  content  = <<EOT
  [nginx]
  ${openstack_networking_floatingip_v2.fip_2.address}
    EOT
}
