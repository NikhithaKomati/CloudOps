
provider "aws" {
  region = var.aws_region 
}

# Create an IAM role for Kinesis Data Firehose
resource "aws_iam_role" "firehose_role" {
  name = var.firehose_iam_role_name
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


# Create an IAM policy for Kinesis Data Firehose
resource "aws_iam_policy" "firehose_policy" {
  name        = var.firehose_iam_policy_name
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
resource "aws_iam_policy_attachment" "firehose_attachment" {
  name       = var.firehose_policy_attachment_name
  policy_arn = aws_iam_policy.firehose_policy.arn
  roles      = [aws_iam_role.firehose_role.name]
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket_prefix = var.s3_bucket_name 
}

# Create a Kinesis Data Firehose delivery stream with S3 as the destination
resource "aws_kinesis_firehose_delivery_stream" "my_delivery_stream" {
  name = var.firehose_kinesis_delivery_stream_name
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.my_bucket.arn
  }
    tags ={
    Name         = var.tag_name
    team         = var.team
    env          = var.env
    owner        = var.owner
    owneremail   = var.owneremail
    creationdate = var.creationdate
  }
}
