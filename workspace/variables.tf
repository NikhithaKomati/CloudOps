variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}

variable "iam_role_name" {
  description = "defining the name of the iam role"
  type = string
  default = "workspace-iam-role"
}

variable "iam_policy_name" {
  description = "defining the name of the iam policy"
  type = string
  default = "workspace-iam-policy"
}

variable "policy_attachement_name" {
  description = "defining the name of the iam policy attachement"
  type = string
  default = "workspace-attachment"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "cidr block for the public subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "cidr block for the private subnet"
  type = string
  default = "10.0.2.0/24"
}


variable "service_directory_name" {
  description = "describing the workspace servie directory name"
  type=string
  default="corp.example.com"
}

variable "serive_directory_password" {
  description = "describing the password for the service directory"
  type = string
  default = "YourStrongPassword123!"
}

variable "type" {
  description = "defining the type of the service directory"
  type = string
  default = "SimpleAD"
}

variable "workspace_directory_name" {
  description = "describing the workspace directory name"
  type = string
  default = "workspace Directory"
}

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