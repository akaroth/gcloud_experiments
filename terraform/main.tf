provider "google" {

  project = var.gcp_project
  region  = var.gcp_region
  zone    = "us-central1-c"
}

resource "google_storage_bucket" "tf-bucket" {
  project       = var.gcp_project
  name          = "tf-test-akaroth"
  location      = var.gcp_region
  force_destroy = true
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

terraform {
  backend "gcs" {
    bucket      = "tf-test-akaroth"
    prefix      = "tfstate-"
  }
}