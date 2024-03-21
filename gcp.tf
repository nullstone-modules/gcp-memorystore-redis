data "google_client_config" "this" {}
data "google_compute_zones" "available" {}
data "google_project" "this" {
  project_id = data.google_client_config.this.project
}

locals {
  project_id      = data.google_client_config.this.project
  project_number  = data.google_project.this.number
  region          = data.google_client_config.this.region
  available_zones = data.google_compute_zones.available.names
}

resource "google_project_service" "redis" {
  service                    = "redis.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "service-networking" {
  service                    = "servicenetworking.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}
