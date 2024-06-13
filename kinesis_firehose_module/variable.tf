variable "aws_region" {
  description = "AWS region for firehose resources"
  type        = string
  default     = "us-east-1"
}

variable "firehose_iam_role_name" {
  description = "defining the name of the iam role"
  type = string
  default = "firehose-role"
}

variable "firehose_iam_policy_name" {
  description = "defining the iam policy name"
  type = string
  default = "firehose-policy"
}

variable "firehose_policy_attachment_name" {
  description = "defining the iam policy attachment"
  type = string
  default = "firehose-attachment"
}

variable "s3_bucket_name" {
  description = "describing the name of s3 bucket"
  type=string
  default = "my-firehose-bucket"
}

variable "firehose_kinesis_delivery_stream_name" {
  description = "defining the kinesis firehose delivery stream"
  type = string
  default = "my-delivery-stream"
}

variable "tag_name" {
  description = "tag name"
  type = string
  default = "kinesis_firehose_name"
}
variable "team" {
  description = "Team name"
  type        = string
  default     = "org_team"
}
variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
variable "owner" {
  description = "Resource owner"
  type        = string
  default     = "owner_name"
}
variable "owneremail" {
  description = "Resource owner email"
  type        = string
  default     = "owner@gmail.com"
}
variable "creationdate" {
  description = "Resource creation date"
  type        = string
  default     = "07-05-2024"
}
