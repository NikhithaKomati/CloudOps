provider "aws" {
  region = var.aws_region
}

#Create an IAM role for the Transcribe service
resource "aws_iam_role" "transcribe_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "firehose.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"  
      }
    ]
  })
}


# Create an IAM policy for transcribe service
resource "aws_iam_policy" "transcribe_policy" {
  name        = var.transcribe_iam_policy_name
  description = "IAM policy for Kinesis Data Firehose"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "firehose:PutRecord",
          "firehose:PutRecordBatch"
        ],
        "Resource": "*"
      }
    ]
  })
}


# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "transcribe_attachment" {
  name       = "transcribe-attachment"
  policy_arn = aws_iam_policy.transcribe_policy.arn
  roles      = [aws_iam_role.transcribe_role.name]
}


# Create an S3 bucket for the input audio file
resource "aws_s3_bucket" "transcribe_input" {
  bucket = "my-transcribe-input-bucket-1"
}

# Create an S3 bucket for the transcription output
# resource "aws_s3_bucket" "transcribe_output" {
#  bucket = "my-transcribe-output-bucket"

# }


# Create an AWS Transcribe language model (optional)
resource "aws_transcribe_language_model" "example_language_model" {
  model_name = var.transcribe_language_model_name
  base_model_name = var.base_model_name
  language_code = var.language_code
  input_data_config {
    data_access_role_arn="aws"
    s3_uri = "s3://${aws_s3_bucket.transcribe_input.id}/custom-language-model-data/"  # specifies the Amazon S3 location where the input data for the custom language model is stored
  }
}


# Create an AWS Transcribe medical vocabulary (optional)
resource "aws_transcribe_medical_vocabulary" "example_medical_vocabulary" {
  vocabulary_name = var.medical_vocabulary_name
  language_code   = var.language_code
  vocabulary_file_uri = "s3://${aws_s3_bucket.transcribe_input.id}/medical-vocabulary.txt"

}

# Create an AWS Transcribe vocabulary (optional)
resource "aws_transcribe_vocabulary" "example_vocabulary" {
  vocabulary_name = "example-vocabulary"
  language_code   = var.language_code
  phrases         = ["example", "phrase", "vocabulary"]
  tags=var.name_tags
}




