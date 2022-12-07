/*
 * @title   Exoscale Demo
 * @author  Taii Shayma
 * @version 1.0
 */

data "exoscale_compute_template" "my_template" {
  zone = var.zone
  name = "Linux Ubuntu 22.04 LTS 64-bit"
}

data "template_file" "node" {
  template = file("cloud-init/scripts/ansible.sh")
  vars = {
    tags      = "node"
    inventory = "prometheus-demo"
  }
}
data "template_cloudinit_config" "node" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.node.rendered
  }
}

resource "exoscale_instance_pool" "instance_pool_sh" {
  zone = var.zone
  name = "my-instance-pool"
  description = "my-instance-pool"
  template_id   = data.exoscale_compute_template.my_template.id
  instance_type = var.instance_type
  disk_size     = var.disk_size
  size          = var.np_size
  key_pair = var.ssh_key
  instance_prefix = var.prefix
  labels = var.labels
  security_group_ids = [exoscale_security_group.sg-sh.id]
  user_data = base64encode(data.template_cloudinit_config.node.rendered)
}

resource "local_file" "dynamic_nodes_inventory"{
  content = templatefile("./hosts.tpl",
    {
      intances_ips = exoscale_instance_pool.instance_pool_sh.instances.*.public_ip_address
    }
  )
  filename = "./cloud-init/playbooks/prometheus/inventory/dynamic_nodes_inventory"
}