module "my-eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.10.1"

  name                   = "myapp-cluster"
  kubernetes_version     = "1.33"
  endpoint_public_access = true

  subnet_ids = var.private_subnets
  vpc_id     = var.vpc_id

  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  tags = {
    Environment = var.env
    Application = "myapp"
    Terraform   = "true"
  }

}