module "my-vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = var.env
    Name = "${var.env}-vpc"
    "kubernetes.io/cluster/myapp-cluster" = "shared"
  }
  
  public_subnet_tags = {
    "kubernetes.io/cluster/myapp-cluster" = "shared"
    "kubernetes.io/role/elb"              = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/myapp-cluster" = "shared"
    "kubernetes.io/role/internal-elb"     = "1"
  }
}