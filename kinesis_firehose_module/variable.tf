variable "aws_region" {
  description = "AWS region for firehose resources"
  type        = string
  default     = "us-east-1"
}

variable "firehose_iam_role_name" {
  default = "firehose-role"
}

variable "firehose_iam_policy_name" {
  default = "firehose-policy"
}

variable "firehose_policy_attachment_name" {
  default = "firehose-attachment"
}

variable "firehose_kinesis_delivery_stream_name" {
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