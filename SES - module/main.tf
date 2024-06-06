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


