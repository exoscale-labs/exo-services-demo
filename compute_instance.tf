/*
 * @title   Exoscale Demo
 * @author  Taii Shayma
 * @version 1.0
 */

data "exoscale_compute_template" "my_instande_template" {
  zone = var.zone
  name = "Linux Ubuntu 22.04 LTS 64-bit"
}

data "template_file" "monitor" {
  template = file("cloud-init/scripts/ansible.sh")
  vars = {
    tags      = "monitor"
    inventory = "dynamic_nodes_inventory"
  }
}

data "template_cloudinit_config" "monitor" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.monitor.rendered
  }
}

resource "exoscale_compute_instance" "instance_sh" {
  zone =  var.zone
  name = "my-instance"
  template_id = data.exoscale_compute_template.my_instande_template.id
  type        = var.instance_type
  disk_size   = var.disk_size
  ssh_key = var.ssh_key
  labels = var.labels
  security_group_ids = [exoscale_security_group.sg-sh.id]
  

  provisioner "file" {
    source      = "./cloud-init/playbooks/prometheus/inventory/dynamic_nodes_inventory"
    destination = "/tmp/dynamic_nodes_inventory"
    connection {
    type = "ssh"
    user = "ubuntu"
    host = exoscale_compute_instance.instance_sh.public_ip_address
    private_key = file("~/.ssh/id_rsa")
    } 
  }

  depends_on = [exoscale_instance_pool.instance_pool_sh]
  user_data = base64encode(data.template_cloudinit_config.monitor.rendered)

}
