module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "myk8sapp-eks-cluster"
  cluster_version = "1.30"

  subnet_ids = module.myk8s_app-vpc.private_subnets  # modified
  vpc_id     = module.myk8s_app-vpc.vpc_id

  tags = {
    environment  = "dev"
    application  = "myk8sapp"
  }

  eks_managed_node_groups = {      #modified
    worker-group-1 = {
      instance_type       = "t2.micro"
      desired_capacity    = 2
    }
    worker-group-2 = {
      instance_type       = "t3.micro"
      desired_capacity    = 1
    }
  }
}
