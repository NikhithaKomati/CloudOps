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