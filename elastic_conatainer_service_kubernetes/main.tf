
provider "aws" {
  region = var.aws_region
}

module "eks" {
  source = "./module"
  iam_role_name = var.iam_role_name
  eks_iam_policy_name = var.eks_iam_policy_name
  eks_cluster_name = var.eks_cluster_name
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  name_tags = var.name_tags
}