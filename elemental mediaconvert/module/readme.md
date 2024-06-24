This Terraform configuration sets up the following AWS resources:

 IAM Role and Policy : Creates an IAM role and policy for the AWS MediaConvert service.
 s3 bucket for input and output storage
 s3 object : added a video file to the input s3 bucket 
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
