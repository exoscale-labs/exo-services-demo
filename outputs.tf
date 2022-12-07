/*
 * @title   Exoscale Demo
 * @author  Taii Shayma
 * @version 1.0
 */

output "my_sks_cluster_state" {
  value = exoscale_sks_cluster.sks_sh.state
}

output "my_database_state" {
  value = exoscale_database.db_sh.state
}
output "instances_ips" {
  value = exoscale_instance_pool.instance_pool_sh.instances.*.public_ip_address
}