/*
 * @title   Exoscale Demo
 * @author  Taii Shayma
 * @version 1.0
 */

resource "exoscale_nlb" "nlb_sh" {
  zone = var.zone
  name = "my-nlb"
}

resource "exoscale_nlb_service" "nlb_service_sh" {
  nlb_id = exoscale_nlb.nlb_sh.id
  zone   = exoscale_nlb.nlb_sh.zone
  name   = "my-nlb-service"
  description = "my-nlb-service"

  instance_pool_id = exoscale_instance_pool.instance_pool_sh.id
    protocol       = "tcp"
    port           = 80
    target_port    = 22
    strategy       = "round-robin"

  healthcheck {
    mode     = "tcp"
    port     = 22
    uri      = "/"
    interval = 5
    timeout  = 3
    retries  = 1
  }
}