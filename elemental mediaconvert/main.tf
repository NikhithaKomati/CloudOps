provider "aws" {
  region = var.aws_region
}

module "mediaconvert-module" {
  source = "./module"
  iam_role_name = var.iam_role_name
  iam_policy = var.iam_policy
  iam_attchment_name = var.iam_attchment_name
  s3_input_bucket_name = var.s3_input_bucket_name
  s3_bucket_output_name = var.s3_bucket_output_name
  media_convert_queue_name = var.media_convert_queue_name
  tag_name = var.tag_name
  team = var.team
  env = var.env
  owner = var.owner
  owneremail = var.owneremail
  creationdate = var.creationdate
}