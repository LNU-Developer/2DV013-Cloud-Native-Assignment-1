# Setup new main computer (on windows and thus cant use ansible)

resource "openstack_compute_instance_v2" "rmc" {
  name              = "rmc"
  availability_zone = var.availability_zone
  key_pair          = var.key_name
  image_name        = var.image_name
  flavor_name       = var.flavor_id
  security_groups   = ["${openstack_compute_secgroup_v2.secgroup_ssh.name}"]
  depends_on        = [openstack_networking_router_interface_v2.int_1]

  network {
    name = openstack_networking_network_v2.network_1.name
  }
}

# Setup nginx machine
resource "openstack_compute_instance_v2" "nginx" {
  depends_on        = [openstack_networking_router_interface_v2.int_1]
  name              = "nginx"
  availability_zone = var.availability_zone
  key_pair          = var.key_name
  image_name        = var.image_name
  flavor_name       = var.flavor_id
  security_groups   = ["${openstack_compute_secgroup_v2.secgroup_ssh.name}", "${openstack_compute_secgroup_v2.secgroup_http.name}"]

  network {
    name = openstack_networking_network_v2.network_1.name
  }
}

output "nginx_ip" {
  value = openstack_networking_floatingip_v2.fip_2.address
}
