1. created aws_directory_service_directory
   name (required)
   password (required)

2. created aws_workspaces_directory
    directory_id (required)
    directory_name (optional)

3. created  aws_workspaces_bundle (used to retrieve information about a specific WorkSpaces bundle)
       name (optional)

4. created aws_workspaces_workspace resource (an create one or more WorkSpaces with the desired configuration)
    directory_id (required)
    bundle_id (required)
    user_name (required)


 to run: 
         terraform init
         terraform plan
         terraform apply
to destroy:
          terraform destroy