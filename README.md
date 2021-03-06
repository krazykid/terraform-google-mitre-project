# `tf-gcp-mitre-project`

## Introduction

This module is meant to create a basic MITRE GCP project. It does the following:

* Creates the GCP project
* Associates it with appropriate GCP billing project
* Adds base GCP services
* Adds a MITRE charge number label
* Add base roles to the group `var.project_user_group_email`

## Input Variables

| `variable`                  |Required?| Type         | Default                | Description                          |
|:----------------------------|:-------:|:-------------|:----------------------:|:-------------------------------------|
| `base_project_id_str`       | Yes     | string       | (none)                 | Base GCP project ID. A random five character string will be appended to the string. Max length 23 characters|
| `project_name_str`          | Yes     | string       | (none)                 | Full name for the project|
| `charge_number_str`         | Yes     | string       | (none)                 | MITRE charge number associated with this project|
| `billing_acct`              | No      | string       | `019884-B55966-1F3971` | GCP billing account to associate with this project|
| `existing_folder_id_str`    | Yes     | string       | (none)                 | GCP folder ID to put the project into. ex: 111111111111|
| `project_user_group_email`  | Yes     | string       | (none)                 | Email address of the Google group that contains the project's users|
| `project_services_list`     | Yes     | list(string) | (none)                 | A list of GCP services turned on for the project|
| `project_user_roles_list`   | Yes     | list(string) | (none)                 | A list of roles that are assigned to project users|
| `disable_services`          | No      | bool         | `false`                | Whether or not to disable services during `destroy`. Remember when disabling GCP services, all resources in that service get deleted |
| `additional_project_labels_map`| No   | map(string)  | `{}`                   | A map of labels to add to the project's metadata |

## Output

| Output Variable Name | Description                                      |
|:--------------------:|:-------------------------------------------------|
| `project_id`         | Newly created GCP project ID                     | 