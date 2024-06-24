variable "aws_region" {
  description = "AWS region for firehose resources"
  type        = string
  default = "us-east-1"
}

variable "firehose_iam_role_name" {
  description = "defining the name of the iam role"
  type = string
}

variable "firehose_iam_policy_name" {
  description = "defining the iam policy name"
  type = string
}

variable "firehose_policy_attachment_name" {
  description = "defining the iam policy attachment"
  type = string
}

variable "s3_bucket_name" {
  description = "describing the name of s3 bucket"
  type=string
}

variable "firehose_kinesis_delivery_stream_name" {
  description = "defining the kinesis firehose delivery stream"
  type = string
}

variable "tag_name" {
  description = "tag name"
  type = string
}
variable "team" {
  description = "Team name"
  type        = string
}
variable "env" {
  description = "Environment name"
  type        = string
}
variable "owner" {
  description = "Resource owner"
  type        = string
}
variable "owneremail" {
  description = "Resource owner email"
  type        = string
}
variable "creationdate" {
  description = "Resource creation date"
  type        = string
}

variable "lambda_iam_role" {
  description = "defining the name of the lambda iam role"
  type=string
}
variable "path_to_zipfile" {
  description = "defining the path to the zipfile"
  type=string
}
variable "file_Name" {
  description = "defining the name of the file"
  type = string
}
variable "function_name" {
  description = "defining the name of the function"
  type = string
}
variable "lambda_function_runtime" {
  description = "defining the version of the python"
  type=string
}