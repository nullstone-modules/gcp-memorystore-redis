output "db_protocol" {
  value       = "redis"
  description = "string ||| This emits `rediss` (secure) or `redis` and is used for generalized data store contracts."
}

locals {
  single_endpoint = "${google_redis_instance.this.host}:${google_redis_instance.this.port}"
}

output "db_endpoint" {
  value       = local.single_endpoint
  description = "string ||| The endpoint URL to access Redis."
}
