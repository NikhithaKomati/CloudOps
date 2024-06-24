
variable "aws_region" {
  description = "AWS region for transcribe resources"
  type        = string
  default     = "us-east-1"
}

variable "iam_role_name" {
  description = "describing a role for the iam_role"
  type = string
}

variable "transcribe_iam_policy_name" {
  description = "defining the name of the iam policy"
  type        = string
}

variable "transcribe_iam_policy_attachment" {
  description = "defining the the name of  the iam policy attachment"
  type        = string
}

variable "transcribe_s3_bucket_name" {
  description = "defining the name of the s3 bucket"
  type        = string
}
variable "transcribe_vocabulary_name" {
  description = "defining the name of the transcribe vocabulary"
  type        = string
}
variable "transcribe_language_model_name" {
  description = "describing the transcribe language model name"
  type        = string
}

variable "language_code" {
  description = "describing the transcribe language code"
  type        = string
}
variable "base_model_name" {
  description = "describing the transcribe base model name"
  type        = string
}

variable "name_tags" {
  description = "Tags to be applied on the naming of the Config"
  type        = map(string)
}
