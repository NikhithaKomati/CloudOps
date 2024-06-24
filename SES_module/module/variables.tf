
# to create ses identity using email
variable "email_address" {
  description = "Email address for SES identity"
  type        = string
}

# to create configuration set by providing the name
variable "name" {
  description = "Name for SES configuration"
  type=string
}

variable "event_destination_name" {
  description = "setting the name for event destination"
  type=string
}

variable "clouwatch_value" {
  description = "describing the cloudwatch destination default value"
  type = string
}

variable "cloudwatch_name" {
  description = "describing the cloudwatch destination default name"
  type = string
}

variable "clouwatch_source" {
  description = "describing the cloudwatch destination source"
  type = string
}