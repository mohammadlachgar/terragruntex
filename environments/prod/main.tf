

locals {
  env = "prod"
}

provider "google" {
  credentials = file("../../creds/serviceaccount.json")
  project = var.project
}

module "vpc" {
  source  = "../../modules/vpc"
  project = var.project
  env     = local.env
}

module "http_server" {
  source  = "../../modules/http_server"
  project = var.project
  subnet  = module.vpc.subnet
}

module "firewall" {
  source  = "../../modules/firewall"
  project = var.project
  subnet  = module.vpc.subnet
}
