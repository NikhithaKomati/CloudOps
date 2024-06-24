
variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}

variable "name" {
    description = "Proxy to handle requests to our API"
    type=string
}

variable "resource_path" {
  description = "describing the name of the resource path"
  type=string
}

variable "integration_type" {
  description = "describing the type of api-gateway-integration"
  type=string
}

variable "stage_name" {
  description = "describing the name of the stage"
  type = string
}

variable "Name" {
    description = "tag name"
    type = string
}

variable "team" {
  description = "Team name"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "owner" {
  description = "Resource owner"
  type        = string
}

variable "owneremail" {
  description = "Resource owner email"
  type        = string
}

variable "creationdate" {
  description = "Resource creation date"
  type        = string
}