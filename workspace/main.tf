
provider "aws" {
  region = var.aws_region
}

module "workspace-module" {
  source = "./module"
  iam_role_name = var.iam_role_name
  iam_policy_name = var.iam_policy_name
  policy_attachement_name = var.policy_attachement_name
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  service_directory_name = var.service_directory_name
  serive_directory_password = var.serive_directory_password
  type = var.type
  workspace_directory_name = var.workspace_directory_name
  name_tags = var.name_tags
}