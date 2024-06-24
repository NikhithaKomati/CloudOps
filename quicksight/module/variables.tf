variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
}
variable "email" {
  description = "defining the email"
  type=string
}
variable "s3_bucket_name" {
  description = "defining the name of the s3 bucket"
  type=string
}
variable "user_role" {
  description = "describing the user role"
}
variable "identity_type" {
  description = "describing the identity type of the user"
  type = string
}
variable "data_source_id" {
  description = "describing the data source id"
  type = string
}
variable "data_source_name" {
  description = "describing the data source name"
  type = string
}
variable "data_set_id" {
  description = "describing the data set id"
  type=string
}
variable "data_set_name" {
  description = "describing the data set name"
  type=string
}
variable "analysis_id" {
  description = "describing the quicksight analysis id"
  type = string
}
variable "analysis_name" {
  description = "describing the quicksight analysis name"
  type = string
}
variable "dashboard_id" {
    description = "describing the quicksight dashboard id"
    type=string
}
variable "dashboard_name" {
    description = "describing the quicksight dashboard name"
    type=string
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