
provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "mediaconvert_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "mediaconvert.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"  
      }
    ]
  })
}


# Create an IAM policy for Kinesis Data Firehose
resource "aws_iam_policy" "mediaconvert_policy" {
  name        = "mediaconvert-policy"
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
resource "aws_iam_policy_attachment" "mediaconvert_attachment" {
  name       = "mediaconvert-attachment"
  policy_arn = aws_iam_policy.mediaconvert_policy.arn
  roles      = [aws_iam_role.mediaconvert_role.name]
}



resource "aws_media_convert_queue" "example_queue" {
  name = var.media_convert_queue_name
  status = "ACTIVE"
 tags = {
    Name         = var.tag_name
    team         = var.team
    env          = var.env
    owner        = var.owner
    owneremail   = var.owneremail
    creationdate = var.creationdate
  }
}

