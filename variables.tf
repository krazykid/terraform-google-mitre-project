variable "base_project_id_str" {
  type        = string
  description = "Base GCP project ID. A random five character string will be appended to the string. Max length 23 characters"
}

variable "project_name_str" {
  type        = string
  description = "Full name for the project"
}

variable "charge_number_str" {
  type        = string
  description = "MITRE charge number associated with this project"
}

variable "billing_acct" {
  type        = string
  default     = "019884-B55966-1F3971"
  description = "GCP billing account to associate with this project"
}

variable "existing_folder_id_str" {
  type        = string
  description = "GCP folder ID to put the project into. ex: 111111111111"
}

variable "project_user_group_email" {
  type        = string
  description = "Email address of the Google group that contains the project's users"
}

variable "project_services_list" {
  type        = list(string)
  description = "A list of GCP services turned on for the project"
}

variable "project_user_roles_list" {
  type        = list(string)
  description = "A list of roles that are assigned to project users"
}

variable "additional_project_labels_map" {
  type        = map(string)
  description = "A dictionary of GCP labels for the project to add (optional)"
  default     = {}
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

  charge_number_map = {
    charge_number = lower(var.charge_number_str)
  }

  all_labels_map = merge(var.additional_project_labels_map, local.charge_number_map)
}


variable "disable_services" {
  type        = bool
  default     = false
  description = "Whether or not to disable services during `destroy`. Remember when disabling GCP services, all resources in that service get deleted"
}