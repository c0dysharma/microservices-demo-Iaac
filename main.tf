provider "aws" {
  region = "ap-south-1"
}

module "my-vpc" {
  source = "./modules/vpc"
  env = var.env
  azs = var.azs
}