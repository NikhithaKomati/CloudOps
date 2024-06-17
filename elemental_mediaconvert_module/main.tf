
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


# Create an IAM policy for mediaconvert
resource "aws_iam_policy" "mediaconvert_policy" {
  name        = var.iam_policy
  description = "IAM policy for elemental mediaconvert"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "mediaconvert:PutRecord",
          "mediaconvert:PutRecordBatch"
        ],
        "Resource" : "*"
      }
    ]
  })
}


# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "mediaconvert_attachment" {
  name       = var.iam_attchment_name
  policy_arn = aws_iam_policy.mediaconvert_policy.arn
  roles      = [aws_iam_role.mediaconvert_role.name]
}

resource "aws_s3_bucket" "input_bucket" {
  bucket = var.s3_input_bucket_name
}

resource "aws_s3_bucket" "output_bucket" {
  bucket = var.s3_bucket_output_name
}

# Add the input file to the S3 input bucket
resource "aws_s3_object" "input_file" {
  bucket = aws_s3_bucket.input_bucket.id
  key    = "sample_video.mp4"
  source = "/home/komatinikhitha/Downloads/sample_video.mp4"
}


resource "aws_media_convert_queue" "example_queue" {
  name   = var.media_convert_queue_name
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





