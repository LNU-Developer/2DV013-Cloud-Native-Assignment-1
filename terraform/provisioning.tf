# Provisin machines
resource "null_resource" "provision" {
  depends_on = [openstack_compute_floatingip_associate_v2.fip_1, openstack_compute_floatingip_associate_v2.fip_2, openstack_compute_instance_v2.nginx, openstack_compute_instance_v2.rmc]
  connection {
    user        = "ubuntu"
    private_key = file(var.identity_file)
    host        = openstack_networking_floatingip_v2.fip_1.address
  }

  provisioner "remote-exec" {
    inline = [
      "echo Updating system and installing Ansible...!",
      "sudo rm -r /var/lib/apt/lists/*",
      "sudo apt -q update",
      "sudo apt install -q ansible -y",
      "sudo ssh-keyscan -H ${openstack_networking_floatingip_v2.fip_2.address} >> ~/.ssh/known_hosts",
      "sudo mkdir ~/ansible/",
      "sudo chmod -R 777 ~/ansible",
      "echo Finished setting up Ansible"
    ]
  }

  provisioner "file" {
    source      = "../ansible/"
    destination = "/home/ubuntu/ansible/"
  }

  provisioner "file" {
    source      = var.identity_file
    destination = "/home/ubuntu/ssh.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod -R 600 /home/ubuntu/ssh.pem",
      "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i ~/ansible/inventory --private-key /home/ubuntu/ssh.pem ~/ansible/ansible-master.yaml",
      "echo Finished running Ansible Playbooks!"
    ]
  }
}
