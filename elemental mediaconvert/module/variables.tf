
variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}

variable "iam_role_name" {
  description = "describing the name of the iam_role"
  type = string
}

variable "iam_policy" {
  description = "defining the name of the iam role policy"
  type = string
}

variable "iam_attchment_name" {
  description = "defining the name of the iam role policy attachment"
  type = string
}

variable "s3_input_bucket_name" {
  description = "defining the name of the input s3 bucket"
  type = string
}

variable "s3_bucket_output_name" {
  description = "defining the name of the output s3 bucket"
  type = string
}

variable "media_convert_queue_name" {
    description = "describing the name of the media convert queue name"
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