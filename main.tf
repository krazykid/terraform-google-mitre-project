provider "google" {
  region          = "us-east4"
  request_timeout = "60m"
}

provider "google-beta" {
  region          = "us-east4"
  request_timeout = "60m"
}

provider "random" {}

provider "null" {}

resource "random_string" "project_suffix" {
  length  = 5
  special = false
  number  = false
  upper   = false
}

resource "google_project" "project" {
  provider   = "google-beta"
  name       = var.project_name_str
  project_id = "${substr(var.base_project_id_str, 0, 22)}-${random_string.project_suffix.result}"

  billing_account = var.billing_acct
  folder_id       = var.existing_folder_id_str

  labels = local.all_labels_map
}

resource "google_project_service" "base_project_services" {
  project = google_project.project.project_id

  for_each                   = toset(local.base_services)
  service                    = each.value
  disable_dependent_services = var.disable_services
  disable_on_destroy         = var.disable_services

  depends_on = [
    google_project.project
  ]
}

resource "google_project_service" "project_services" {
  project = google_project.project.project_id

  for_each                   = toset(var.project_services_list)
  service                    = each.value
  disable_dependent_services = var.disable_services
  disable_on_destroy         = var.disable_services

  depends_on = [
    google_project.project,
    google_project_service.base_project_services
  ]
}

locals {
  gcp_project_user_group_str = "group:${var.project_user_group_email}"
}

resource "google_project_iam_member" "base_user_roles" {
  project = google_project.project.project_id
  member  = local.gcp_project_user_group_str

  for_each = toset(local.base_user_roles)
  role     = each.value

  depends_on = [
    google_project.project,
    google_project_service.project_services,
    google_project_service.base_project_services
  ]
}

resource "google_project_iam_member" "project_user_roles" {
  project = google_project.project.project_id
  member  = local.gcp_project_user_group_str

  for_each = toset(var.project_user_roles_list)
  role     = each.value

  depends_on = [
    google_project.project,
    google_project_service.project_services,
    google_project_service.base_project_services
  ]
}
