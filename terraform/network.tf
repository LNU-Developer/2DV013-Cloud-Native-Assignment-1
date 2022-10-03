# Create Network.
resource "openstack_networking_network_v2" "network_1" {
  name           = "network_1"
  admin_state_up = "true"
}

# Create Subnet.
resource "openstack_networking_subnet_v2" "subnet_1" {
  name       = "subnet_1"
  network_id = openstack_networking_network_v2.network_1.id
  cidr       = var.subnetwork_cidr
  ip_version = 4
}

# Create Router and connect to Network.
resource "openstack_networking_router_v2" "router_1" {
  name                = "router_1"
  admin_state_up      = true
  external_network_id = var.network_id
}

# Create Interface between Router and Subnet.
resource "openstack_networking_router_interface_v2" "int_1" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_1.id
}
