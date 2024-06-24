variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}

variable "iam_role_name" {
  description = "describing the name of the iam role name"
  type=string
  default = "eks-cluster-role"
}

variable "eks_iam_policy_name" {
  description = "defining the name of the iam policy"
  type = string
  default = "eks-policy"
}


variable "eks_cluster_name" {
  description = "describing the name of the aws eks cluster"
  type = string
  default = "example-cluster"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = map(string)
  default = {
    "public 1" = "10.0.1.0/24"
    "public 2" = "10.0.2.0/24"
  }
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = map(string)
  default = {
    "private 1" = "10.0.3.0/24"
    "private 2" = "10.0.4.0/24"
  }
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
