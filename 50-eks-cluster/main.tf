module "eks" {
  source          = "../terraform-aws-eks"
  cluster_version = var.eks_version

  eks_managed_node_groups = {
    blue = {
      create         = var.enable_blue
      # no kubernetes_version here — picks up cluster_version automatically
      instance_types = ["m5.xlarge"]
      capacity_type  = "SPOT"
      min_size       = 2
      max_size       = 10
      desired_size   = 2
      labels         = { nodegroup = "blue" }
      iam_role_additional_policies = {
        amazonEBS = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
        amazonEFS = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
      }
    }

    green = {
      create             = var.enable_green
      kubernetes_version = var.eks_nodegroup_green_version  # only matters during upgrade
      instance_types     = ["m5.xlarge"]
      capacity_type      = "SPOT"
      min_size           = 2
      max_size           = 10
      desired_size       = 2
      labels             = { nodegroup = "green" }
      iam_role_additional_policies = {
        amazonEBS = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
        amazonEFS = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
      }
    }
  }
}