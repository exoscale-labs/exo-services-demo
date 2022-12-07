/*
 * @title   Exoscale Demo
 * @author  Taii Shayma
 * @version 1.0
 */

resource "exoscale_database" "db_sh" {
  zone = var.zone
  name = "my-redis-database"

  type = "redis"
  plan = "business-1"

  maintenance_dow  = "sunday"
  maintenance_time = "23:00:00"

  termination_protection = false

  redis {

    ip_filter = [
      "0.0.0.0/0",
    ]

    redis_settings = jsonencode({
      number_of_databases: 20
    })
  }
}

