variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}

# to create ses identity using email
variable "email_address" {
  description = "Email address for SES identity"
  type        = string
}

# to create configuration set by providing the name
variable "name" {
  description = "Name for SES configuration"
  type=string
  default = "configuration-set"
}

variable "event_destination_name" {
  description = "setting the name for event destination"
  type=string
  default = "my-event-destination"
}

variable "clouwatch_value" {
  description = "describing the cloudwatch destination default value"
  type = string
  default = "default"
}

variable "cloudwatch_name" {
  description = "describing the cloudwatch destination default name"
  type = string
  default = "dimension"
}

variable "clouwatch_source" {
  description = "describing the cloudwatch destination source"
  type = string
  default = "emailHeader"
}
