variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}

variable "service_directory_name" {
  description = "describing the workspace servie directory name"
  type=string
  default="corp.example.com"
}

# variable "workspace_directory_name" {
#   description = "describing the workspace directory name"
#   type = string
#   default = "Example Directory"
# }

variable "name_tags" {
  description = "Tags to be applied on the naming of the Config"
  type        = map(string)
  default = {
    Name         = "my-workspace"
    env          = "dev"
    team         = "cloudops"
    owner        = "owner name"
    owneremail   = "owner@mail.com"
    creationdate = "10-06-2024"
  }
}
