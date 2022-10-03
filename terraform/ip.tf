# Pull floating IP for jump machine.
resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = var.pool
}

# Pull floating IP for load balancer.
resource "openstack_networking_floatingip_v2" "fip_2" {
  pool = var.pool
}

# Connect floating IP to jump machine
resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = openstack_networking_floatingip_v2.fip_1.address
  instance_id = openstack_compute_instance_v2.rmc.id
}

# Connect floating IP to jump machine
resource "openstack_compute_floatingip_associate_v2" "fip_2" {
  floating_ip = openstack_networking_floatingip_v2.fip_2.address
  instance_id = openstack_compute_instance_v2.nginx.id
}
