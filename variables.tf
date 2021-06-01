variable "base_project_id_str" {
  type = string
}

variable "project_name_str" {
  type = string
}

variable "charge_number_str" {
  type = string
}

variable "billing_acct" {
  type    = string
  default = "019884-B55966-1F3971"
}

variable "existing_folder_id_str" {
  type = string
}

variable "project_user_group_email" {
  type = string
}

variable "project_services_list" {
  type = list(string)
}

variable "project_user_roles_list" {
  type = list(string)
}

locals {
  base_services = [
    "cloudbuild.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudtrace.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "oslogin.googleapis.com",
    "secretmanager.googleapis.com",
    "sql-component.googleapis.com",
    "sqladmin.googleapis.com",
    "stackdriver.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
  ]

  base_user_roles = [
    "roles/browser",
    "roles/viewer",
  ]
}
