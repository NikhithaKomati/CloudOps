variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}
variable "email" {
  description = "defining the email"
  type=string
  default = "name@gmail.com"
}
variable "s3_bucket_name" {
  description = "defining the name of the s3 bucket"
  type=string
  default = "my-quicksight-bucket"
}
variable "user_role" {
  description = "describing the user role"
  type = string
  default = "AUTHOR"
}
variable "identity_type" {
  description = "describing the identity type of the user"
  type = string
  default = "IAM"
}
variable "data_source_id" {
  description = "describing the data source id"
  type = string
  default = "quicksight-data-source"
}
variable "data_source_name" {
  description = "describing the data source name"
  type = string
  default = "Quicksight Data Source"
}
variable "data_set_id" {
  description = "describing the data set id"
  type=string
  default = "quicksight-data-set"
}
variable "data_set_name" {
  description = "describing the data set name"
  type=string
  default = "Quicksight Data Set"
}
variable "analysis_id" {
  description = "describing the quicksight analysis id"
  type = string
  default = "quicksight-analysis"
}
variable "analysis_name" {
  description = "describing the quicksight analysis name"
  type = string
  default = "Quicksight Analysis"
}
variable "dashboard_id" {
    description = "describing the quicksight dashboard id"
    type=string
    default = "quicksight-dashboard"
}
variable "dashboard_name" {
    description = "describing the quicksight dashboard name"
    type=string
    default = "Quicksight Dashboard"
}

variable "name_tags" {
  description = "Tags to be applied on the naming of the Config"
  type        = map(string)
  default = {
    Name         = "my-quicksight"
    env          = "dev"
    team         = "cloudops"
    owner        = "owner name"
    owneremail   = "owner@mail.com"
    creationdate = "08-06-2024"
  }

}