# Create SSH security group.
resource "openstack_compute_secgroup_v2" "secgroup_ssh" {
  name        = "ssh"
  description = "opening ssh"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

# Create HTTP security group.
resource "openstack_compute_secgroup_v2" "secgroup_http" {
  name        = "http"
  description = "opening http"

  rule {
    from_port   = 8081
    to_port     = 8081
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
