terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }

    google = {
      source = "hashicorp/google"
    }

    google-beta = {
      source = "hashicorp/google-beta"
    }

    null = {
      source = "hashicorp/null"
    }
  }
}