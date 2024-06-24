variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}

variable "iam_role_name" {
  description = "describing the name of the iam role name"
  type=string
}

variable "eks_iam_policy_name" {
  description = "defining the name of the iam policy"
  type = string
}


variable "eks_cluster_name" {
  description = "describing the name of the aws eks cluster"
  type = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = map(string)
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = map(string)
}

variable "name_tags" {
  description = "Tags to be applied on the naming of the Config"
  type        = map(string)
  default = {
    Name         = "my-elastic_container_service_kubernetes"
    env          = "dev"
    team         = "cloudops"
    owner        = "owner name"
    owneremail   = "owner@mail.com"
    creationdate = "09-06-2024"
  }
}
