//variable "tf_bucket_name" {
//  type = string
//  default = "mitre-tf-951cfab8-0f05-4e85-aee6-dae3c74b1e5c"
//}
//
//variable "tf_bucket_prefix" {
//  type = string
//}
//

variable "project_id_str" {
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


variable "project_user_roles_list" {
  type = list(string)
}

variable "project_services_list" {
  type = list(string)
}


//locals {
//
//  dev_roles = [
//    "roles/browser",
//    "roles/cloudfunctions.admin",
//    "roles/datastore.owner",
//    "roles/editor",
//    "roles/firebase.analyticsAdmin",
//    "roles/firebasecrashlytics.admin",
//    "roles/firebasedatabase.admin",
//    "roles/storage.admin",
//    "roles/viewer",
//  ]
//
//  gcp_services = [
//    "appengine.googleapis.com",
//    "bigquery.googleapis.com",
//    "bigquerystorage.googleapis.com",
//    "cloudapis.googleapis.com",
//    "cloudbuild.googleapis.com",
//    "clouddebugger.googleapis.com",
//    "cloudfunctions.googleapis.com",
//    "cloudresourcemanager.googleapis.com",
//    "cloudtrace.googleapis.com",
//    "containerregistry.googleapis.com",
//    "datastore.googleapis.com",
//    "deploymentmanager.googleapis.com",
//    "fcm.googleapis.com",
//    "fcmregistrations.googleapis.com",
//    "firebase.googleapis.com",
//    "firebaseappdistribution.googleapis.com",
//    "firebasedatabase.googleapis.com",
//    "firebasedynamiclinks.googleapis.com",
//    "firebaseextensions.googleapis.com",
//    "firebasehosting.googleapis.com",
//    "firebaseinstallations.googleapis.com",
//    "firebaseremoteconfig.googleapis.com",
//    "firebaserules.googleapis.com",
//    "firestore.googleapis.com",
//    "googlecloudmessaging.googleapis.com",
//    "iamcredentials.googleapis.com",
//    "identitytoolkit.googleapis.com",
//    "logging.googleapis.com",
//    "mobilecrashreporting.googleapis.com",
//    "monitoring.googleapis.com",
//    "pubsub.googleapis.com",
//    "runtimeconfig.googleapis.com",
//    "securetoken.googleapis.com",
//    "servicemanagement.googleapis.com",
//    "serviceusage.googleapis.com",
//    "sql-component.googleapis.com",
//    "storage-api.googleapis.com",
//    "storage-component.googleapis.com",
//    "storage.googleapis.com",
//    "testing.googleapis.com"
//  ]
//}
