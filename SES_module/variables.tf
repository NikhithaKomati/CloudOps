variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-2"
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

variable "smtp_username" {
  description = "Username for the SES SMTP password"
  type        = string
}
