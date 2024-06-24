
variable "aws_region" {
  description = "AWS region for SES resources"
  type        = string
  default     = "us-east-1"
}

variable "name" {
    description = "Proxy to handle requests to our API"
    type=string
    default = "first-api"
}

variable "resource_path" {
  description = "describing the name of the resource path"
  type=string
  default = "example-resource"
}

variable "integration_type" {
  description = "describing the type of api-gateway-integration"
  type=string
  default = "MOCK"
}

variable "stage_name" {
  description = "describing the name of the stage"
  type = string
  default = "production"
}

variable "Name" {
    description = "tag name"
    default = "tag-name"
}

variable "team" {
  description = "Team name"
  type        = string
  default     = "org_team"
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Resource owner"
  type        = string
  default     = "owner_name"
}

variable "owneremail" {
  description = "Resource owner email"
  type        = string
  default     = "owner@gmail.com"
}

variable "creationdate" {
  description = "Resource creation date"
  type        = string
  default     = "07-05-2024"
}