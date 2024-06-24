provider "aws" {
  region = var.aws_region
}

module "transcribe" {
  source = "./module"
  iam_role_name = var.iam_role_name
  transcribe_iam_policy_name = var.transcribe_iam_policy_name
  transcribe_iam_policy_attachment = var.transcribe_iam_policy_attachment
  transcribe_s3_bucket_name = var.transcribe_s3_bucket_name
  transcribe_vocabulary_name = var.transcribe_vocabulary_name
  transcribe_language_model_name = var.transcribe_language_model_name
  language_code = var.language_code
  base_model_name = var.base_model_name
  name_tags = var.name_tags
}