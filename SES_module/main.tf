provider "aws" {
  region = var.aws_region
}

module "ses-module" {
  source = "./module"
  name=var.name
  email_address = var.email_address
  cloudwatch_name = var.cloudwatch_name
  clouwatch_source = var.clouwatch_source
  clouwatch_value = var.clouwatch_value
  event_destination_name = var.event_destination_name
}
