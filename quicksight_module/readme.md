
This Terraform configuration sets up the necessary infrastructure for an AWS QuickSight :


QuickSight User: Creates a QuickSight user with the specified email, namespace, user role, and identity type.
S3 Bucket: Creates an S3 bucket to store the data for the QuickSight data source.
S3 Object: Uploads a local file (students.csv) to the S3 bucket.
QuickSight Data Source: Creates a QuickSight data source, specifying the S3 bucket and the path to the uploaded students file.
QuickSight Data Set: Creates a QuickSight data set, specifying the data source and the input columns.
QuickSight Analysis: Creates a QuickSight analysis, referencing the data set.
QuickSight Dashboard: Creates a QuickSight dashboard, referencing the data set.


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

---> It is a paid service so, i did without terraform apply, and done with basic example taking students.csv

![Screenshot from 2024-06-13 19-04-19](https://github.com/NikhithaKomati/CloudOps/assets/169144759/3876017b-bb88-439f-903e-6163ee8f17b3)


