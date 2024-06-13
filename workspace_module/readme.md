
This Terraform configuration sets up the necessary infrastructure for an AWS Workspaces:

IAM role for workspaces : Creates an IAM role with the necessary permissions for AWS Workspaces.                      
IAM policy for workspaces :  Creates an IAM policy that grants the necessary permissions to the Workspaces IAM role.
Attaching IAM policy to IAM role : Attaches the Workspaces IAM policy to the Workspaces IAM role.                     
vpc : created a vpc with public and private subnets.                                                                  
Security group for directory service : Creates a security group for the Directory Service                             
Workspaces default role : creates the workspaces_DefaultRole IAM role with the necessary  permissions for workspaces. 
Attaching Default role policy : Attaches the Workspaces IAM policy to the workspaces_DefaultRole                      
creating directory service simple AD : Creates a Directory Service Simple AD directory within the defined VPC.


1. created aws_directory_service_directory
   name (required)
   password (required)
   type (optional)
   vpc_settings (optional)
   tags (optional)

<!-- 2. created aws_workspaces_directory
    directory_id (required)
    directory_name (optional) -->
    
to run: 
         terraform init
         terraform plan
         terraform apply
to destroy:
          terraform destroy


aws workspaces is available only in some regions. So, I just created simple directory in workspaces. 
