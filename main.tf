provider "aws" {
  region = "ap-south-1"
}

module "my-vpc" {
  source = "./modules/vpc"
  env = var.env
  azs = var.azs
}

module "my-eks" {
  source = "./modules/eks"
  env = var.env
  private_subnets = module.my-vpc.my-vpc-details.private_subnets
  vpc_id = module.my-vpc.my-vpc-details.vpc_id
}