
1. created aws_quicksight_user resource (used to create a user in Amazon QuickSight)  
   
     email (required)
     namespace (optional)
     user_role (required)
     identity_type (required)

---------------------

2.  created s3 bucket
    
-------------

3.  uploading file to s3 bucket (create or update an object (file) in an Amazon S3 bucket)

     bucket (required)
     key (required)
     source (optional)

---------

4.  created aws_quicksight_data_source  (create a data source in Amazon QuickSight.)
 
   data_source_id (required)
   name (required)
   parameters (required)
   type (required)

--------------

5.  created aws_quicksight_data_set

    data_set_id (required)
    name (required)
    import_mode (required)
    physical_table_map (required)

---------------

6. created aws_quicksight_analysis

    analysis_id (required)
    name (required)
    definition (option)

-----------------

7. created aws_quicksight_dashboard

     dashboard_id (required)
     name (required)
     version_description (required)
     definition (optional)



to run:
            terraform init
            terraform plan
            terraform apply
to destroy: 
            terraform destroy