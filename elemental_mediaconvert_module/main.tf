
provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "mediaconvert_role" {
  name = var.iam_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "mediaconvert.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "mediaconvert_role_policy_attachment" {
  role       = aws_iam_role.mediaconvert_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElementalMediaConvertRole"
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

