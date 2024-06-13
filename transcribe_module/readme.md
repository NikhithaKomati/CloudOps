
This Terraform configuration creates the necessary resources for an AWS Transcribe:

IAM role : IAM role for the transcribe service
IAM policy : grants necessary permissions for the transcribe service
s3 bucket : created an s3 bucket to store the files
s3 object : to automatically add the audio and text file to s3 bucket 
aws transcribe vocabulary : creating a custom vocabulary can help improve the accuracy of the transcription. it is useful when related with domain-specific terminology(medical,legal,technical etc..) or user-specific
aws transcribe laguage model : Custom language models are designed to improve transcription accuracy for domain-specific speech.(closer your text content is to your audio content, the more accurate your model)
this only accepts plane text files

1. created an s3 bucket

   input-s3-bucket  (store the audio files that we want Transcribe to process and transcribe.)

----------------------

2. created an s3 object (which helps to add folders or files to the s3 bucket)

     bucket (required) --> to access with s3 bucket
     key (required)  -->  directive/filename.extension
     source (required)  --> path of file in local system


3. created aws_transcribe_vocabulary
   
   vocabulary_name (required)
   language_code (required)
   phrases (optional)
   tags (optional)

4. created aws_transcribe_vocabulary
   
   vocabulary_name (required)
   language_code (required)
   phrases (optional)
   tags (optional)

5. created aws_transcribe_language_model (create a custom language model for AWS Transcribe)
    model_name (required)
    base_model_name (required)
    language_code (required)
    input_data_config (required)
      s3_uri (specifies the S3 URI where the input data for the custom language model is stored)

-------------------------

to run 
   terraform init
   terraform plan
   terraform apply

to destroy
   terraform destroy


i tried to convert an audio file to text but it is asking for read permission 


![alt text](<Screenshot from 2024-06-13 17-46-37.png>)
