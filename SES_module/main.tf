provider "aws" {
  region = var.aws_region
}

# Create an SES email identity
resource "aws_ses_email_identity" "setting-Email" {
  email = var.email_address
}

# Create an SES configuration set
resource "aws_ses_configuration_set" "setting-configuration" {
  name = var.name 
}

resource "aws_ses_event_destination" "example" {
  name                   = "example-event-destination"
  configuration_set_name = aws_ses_configuration_set.setting-configuration.name
  enabled                = true
  matching_types         = ["bounce", "complaint", "delivery", "send"]
}




