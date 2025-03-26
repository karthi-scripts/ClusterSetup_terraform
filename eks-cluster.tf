module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = module.vpc.private_subnets

  enable_irsa = true
  cluster_endpoint_public_access  = true
  tags = {
    cluster = "demo"
  }
  enable_cluster_creator_admin_permissions = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  
  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_ARM_64"
    instance_types         = ["t4g.small"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {

    # default_x86_64 = {
    #   ami_type               = "AL2_x86_64"
    # instance_types         = ["t3a.nano"]
    #   min_size     = 0
    #   max_size     = 1
    #   desired_size = 0
    # }

    default_arm_64 = {
      min_size     = 2
      max_size     = 2
      desired_size = 2
    }
  }
}

