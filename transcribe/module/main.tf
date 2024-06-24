provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "transcribe_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "transcribe.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"  
      }
    ]
  })
}


# Create an IAM policy for Kinesis Data Firehose
resource "aws_iam_policy" "transcribe_policy" {
  name        = var.transcribe_iam_policy_name
  description = "IAM policy for transcribe"
  
  policy = jsonencode({
    "Version": "2012-10-17",
     "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:GetObject"
        ],
        "Resource": [
          "arn:aws:s3:::my-transcribe-input-bucket-1/transcribe/transcribe_audio.mp3"
        ]
      },
      {
        "Effect": "Allow",
        "Action": [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Resource": [
          "arn:aws:s3:::my-transcribe-input-bucket-1",
          "arn:aws:s3:::my-transcribe-output-bucket-1/*"
        ]
      }
    ]
  })
}


# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "transcribe_attachment" {
  name       = var.transcribe_iam_policy_attachment
  policy_arn = aws_iam_policy.transcribe_policy.arn
  roles      = [aws_iam_role.transcribe_role.name]
}

# Create an S3 bucket for the input audio file
resource "aws_s3_bucket" "transcribe_input" {
  bucket = var.transcribe_s3_bucket_name
}

resource "aws_s3_object" "transcribe_input_file" {
  bucket = aws_s3_bucket.transcribe_input.id
  key    = "transcribe/transcribe_audio.mp3"
  source = "/home/komatinikhitha/Downloads/transcribe_audio.mp3"
}

resource "aws_s3_object" "transcribe_input_file-1" {
  bucket = aws_s3_bucket.transcribe_input.id
  key    = "transcribe/transcribe.txt"
  source = "/home/komatinikhitha/Downloads/transcribe.txt"
}


# Create an AWS Transcribe vocabulary (optional)
resource "aws_transcribe_vocabulary" "example_vocabulary" {
  vocabulary_name = var.transcribe_vocabulary_name
  language_code   = var.language_code
  phrases         = ["example", "phrase", "vocabulary"]
  tags=var.name_tags
}

resource "aws_transcribe_language_model" "example_language_model" {
  model_name = var.transcribe_language_model_name
  base_model_name = var.base_model_name
  language_code = "en-US"
  input_data_config {
    data_access_role_arn = aws_iam_role.transcribe_role.arn
    s3_uri = "s3://my-transcribe-input-bucket-1/transcribe/"
  }
}


