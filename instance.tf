locals {
  translated_version = upper(replace(var.redis_version, ".", "_"))
}

resource "google_redis_instance" "this" {
  name           = local.resource_name
  display_name   = local.block_name
  labels         = local.labels
  redis_version  = "REDIS_${local.translated_version}"
  tier           = "STANDARD_HA"
  memory_size_gb = 1

  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  authorized_network      = data.google_compute_network.vpc.id

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 0
        minutes = 30
        seconds = 0
        nanos   = 0
      }
    }
  }
}
