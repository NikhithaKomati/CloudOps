
variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}

variable "iam_role_name" {
  description = "describing the name of the iam_role"
  type = string
  default = "MediaConvertRole"
}
variable "media_convert_queue_name" {
    description = "describing the name of the media convert queue name"
    type = string
    default = "example-queue"
  
}

variable "tag_name" {
  description = "tag name"
  type = string
  default = "elemetal_mediaconvert_name"
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
  default     = "06-05-2024"
}