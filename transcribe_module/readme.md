
1. created 2 s3 buckets for input and output 

   input-s3-bucket  (store the audio files that we want Transcribe to process and transcribe.)
   output-s3-bucket (generate the transcripts and store in output s3 bucket)

----------------------

2. created aws_transcribe_language_model (create a custom language model for AWS Transcribe)
    model_name (required)
    base_model_name (required)
    language_code (required)
    input_data_config (required)
      s3_uri (specifies the S3 URI where the input data for the custom language model is stored)

-------------------------

3. created aws_transcribe_medical_vocabulary
   vocabulary_name (required)
   language_code (required)
   vocabulary_file_uri (required)

-------------------

4. created aws_transcribe_vocabulary
   
   vocabulary_name (required)
   language_code (required)
   phrases (optional)
   tags (optional)

---------

to run 
   terraform init
   terraform plan
   terraform apply

to destroy
   terraform destroy