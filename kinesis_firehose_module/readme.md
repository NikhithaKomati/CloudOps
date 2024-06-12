
This Terraform configuration sets up the following AWS resources:

IAM Role and Policy : Creates an IAM role and policy for the Kinesis Data Firehose service.                              
S3 Bucket : Creates an S3 bucket to be used as the destination for the Kinesis Data Firehose delivery stream.         
Kinesis Data Firehose Delivery Stream : Creates a Kinesis Data Firehose delivery stream with the S3 bucket as the destination.

1.  first I have created an iam_role (acts as an intermediary between the Firehose service and  the resources it needs to access, such as an S3 bucket on behalf of  firehose service)

    i. name (optional)  --> taken form variable .tf
    ii. assume_role_policy (required)  --> defines the trust policy for the IAM role, which specifies  who can assume the role.
    --> it defines the version 
    --> jsonencode ( convert the JSON-formatted policy document into a string )
   iii.  statement (optional)

----------------------------------------

2.  created aws_iam_policy (JSON document that defines the permissions for an IAM entity (such as a user, group, or role) to access specific AWS resources or perform specific actions)

   name (optional)   --> taken form variable .tf
   description (optional)
   policy (required)

--------------------------------

3. created aws_iam_policy_attachment (which is used to attach an IAM policy to an IAM role)

      name (required)
      policy_arn (required)
      roles (optional)  --> specifies the IAM role(s) to which the policy will be attached

-------------------

4. created an s3 bucket(will be used as the destination for the Kinesis Data Firehose delivery stream)

      bucker_prefix 

----------

5. created  Kinesis Data Firehose delivery stream

     i.  name (required)
     ii.  destination (required)
     iii. extended_s3_configuration (required)  --> ensures that the Kinesis Data Firehose service can successfully deliver data to the specified S3 bucket, with the necessary permissions and configuration to do so.

--------

steps to run the application

  terraform init
  terraform plan
  terraform apply
   
to destroy 

  terraform destroy
