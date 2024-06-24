
provider "aws" {
  region = var.aws_region
}

module "quicksight-module" {
  source = "./module"
  aws_region = var.aws_region
  email = var.email
  s3_bucket_name = var.s3_bucket_name
  user_role = var.user_role
  identity_type = var.identity_type
  data_source_id = var.data_source_id
  data_source_name = var.data_source_name
  data_set_id = var.data_set_id
  data_set_name = var.data_set_name
  analysis_id = var.analysis_id
  analysis_name = var.analysis_name
  dashboard_id = var.dashboard_id
  dashboard_name = var.dashboard_name
  name_tags = var.name_tags
}