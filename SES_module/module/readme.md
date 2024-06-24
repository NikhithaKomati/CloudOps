
This Terraform configuration sets up the following AWS resources:

SES Email Identity : Creates an email identity in Amazon SES (Simple Email Service) for the specified email address.
SES Configuration Set : Creates an SES configuration set, which is a collection of rules that can be applied to the email sending process.
SES Event Destination : Creates an event destination that sends email events (bounce, complaint, delivery, and send) to Amazon CloudWatch.

---------------

1. created an aws_ses_email_identity resource 
    email (required)

-------------------------

2. created an aws_ses_configuration_set resource
    name (required)
    
    the configuration set should be different for different mail id

----------------------

3. created an  aws_ses_event_destination resource
     name (required)
     configuration_set_name (required)
     enabled (optional)
     matching_types (required) --> specifies the types of events that the event destination should receive

---------------

to run: 
         terraform init
         terraform plan
         terraform apply
to destroy:
             terraform destroy