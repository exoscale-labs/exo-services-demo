/*
 * @title   Exoscale Demo
 * @author  Taii Shayma
 * @version 1.0
 */

resource "exoscale_security_group" "sg-sh" {
  name             = "my-security-group"
}

resource "exoscale_security_group_rule" "sks_nodes_logs_rule" {
  security_group_id = exoscale_security_group.sg-sh.id
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 10250
  end_port          = 10250
  user_security_group_id = exoscale_security_group.sg-sh.id
}

resource "exoscale_security_group_rule" "sks_nodes_calico" {
  security_group_id      = exoscale_security_group.sg-sh.id
  type                   = "INGRESS"
  protocol               = "UDP"
  start_port             = 4789
  end_port               = 4789
  user_security_group_id = exoscale_security_group.sg-sh.id
}

resource "exoscale_security_group_rule" "sks_nodes_ccm" {
  security_group_id = exoscale_security_group.sg-sh.id
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 30000
  end_port          = 32767
  cidr              = "0.0.0.0/0"
}

resource "exoscale_security_group_rule" "node_exporter" {
  security_group_id = exoscale_security_group.sg-sh.id
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 9100
  end_port          = 9100
  cidr              = "0.0.0.0/0"
}

resource "exoscale_security_group_rule" "prometheus" {
  security_group_id = exoscale_security_group.sg-sh.id
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 9090
  end_port          = 9090
  cidr              = "0.0.0.0/0"
}

resource "exoscale_security_group_rule" "grafana" {
  security_group_id = exoscale_security_group.sg-sh.id
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 3000
  end_port          = 3000
  cidr              = "0.0.0.0/0"
}

resource "exoscale_security_group_rule" "ssh" {
  security_group_id = exoscale_security_group.sg-sh.id
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 22
  end_port          = 22
  cidr              = "0.0.0.0/0"
}

resource "exoscale_security_group_rule" "http" {
  security_group_id = exoscale_security_group.sg-sh.id
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 80
  end_port          = 80
  cidr              = "0.0.0.0/0"
}
