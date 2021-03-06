provider "google" {
  project = "mamz-project"
  region  = "us-west1"
}

terraform {
  required_providers {
    google = {
      version = "~> 3.90.0"
      source  = "hashicorp/google"
    }
  }
}