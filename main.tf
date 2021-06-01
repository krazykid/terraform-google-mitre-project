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
  project_id = "${var.project_id_str}-${random_string.project_suffix.result}"

  billing_account = var.billing_acct
  folder_id       = var.existing_folder_id_str

  labels = {
    charge_number = var.charge_number_str
  }
}

resource "google_project_service" "project_services" {
  project = google_project.project.project_id
  depends_on = [
  google_project.project]

  for_each                   = toset(var.project_services_list)
  service                    = each.value
  disable_dependent_services = true
}

locals {
  gcp_project_user_group_str = "group:${var.project_user_group_email}"
}

resource "google_project_iam_member" "dev_roles" {
  project = google_project.project.project_id
  member  = local.gcp_project_user_group_str

  for_each = toset(var.project_user_roles_list)
  role     = each.value

  depends_on = [
    google_project.project,
    google_project_service.project_services
  ]
}

resource "google_firebase_project" "firebase_project" {
  provider = "google-beta"
  project  = google_project.project.project_id
}
