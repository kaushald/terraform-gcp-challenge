terraform {

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.35.0"
    }
  }
    backend "gcs" {
      bucket  = "tf-bucket-372741"
      prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "instances" {
  source     = "./modules/instances"
  region     = var.region
  zone       = var.zone
  project_id = var.project_id
}

module "storage" {
  source     = "./modules/storage"
  region     = var.region
  zone       = var.zone
  project_id = var.project_id
}

module "network_vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = ">= 3.45.0"
  project_id   = var.project_id  
  network_name = "tf-vpc-026907"
  routing_mode = "GLOBAL"
}

module "network_subnets" {
  source  = "terraform-google-modules/network/google//modules/subnets"
  version = ">= 3.45.0"
  project_id   = var.project_id
    network_name = "tf-vpc-026907"
      subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = var.region
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = var.region
        }
    ]
}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
 network = "projects/qwiklabs-gcp-04-d3c051057640/global/networks/tf-vpc-026907"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}