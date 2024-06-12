This Terraform configuration sets up the following AWS resources:

 IAM Role and Policy : Creates an IAM role and policy for the AWS MediaConvert service.
 MediaConvert Queue : Creates an AWS MediaConvert queue.


create an aws_media_convert_queue 

name (required)
status (optional)
tags (optional)

to run 
   terraform init
   terraform plan
   terraform apply

to destroy
   terraform destroy

---> This is a paid service, so I just did till terraform plan.
