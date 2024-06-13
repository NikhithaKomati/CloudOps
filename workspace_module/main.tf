provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "workspace_role" {
  name = "workspace_iam_role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "workspaces.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"  
      }
    ]
  })
}

# Create an IAM policy for workspaces
resource "aws_iam_policy" "workspace_policy" {
  name        = "workspace-iam-policy"
  description = "IAM policy for workspace"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "workspaces:PutRecord",
          "workspaces:PutRecordBatch"
        ],
        "Resource": "*"
      }
    ]
  })
}

# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "workspace_attachment" {
  name       ="workspaces-attachment"
  policy_arn = aws_iam_policy.workspace_policy.arn
  roles      = [aws_iam_role.workspace_role.name]
}

# Define the VPC
resource "aws_vpc" "example-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Example VPC"
  }
}

# Create public and private subnets
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.example-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.example-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_security_group" "directory_service" {
  name_prefix = "directory-service-"
  vpc_id      = aws_vpc.example-vpc.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

# Create the workspaces_DefaultRole IAM role
resource "aws_iam_role" "workspaces_default_role" {
  name = "workspaces_DefaultRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "workspaces.amazonaws.com"
        }
      },
    ]
  })
}

# Attach the AmazonWorkSpacesFullAccess policy to the workspaces_DefaultRole
resource "aws_iam_role_policy_attachment" "workspaces_default_role_policy_attachment" {
  policy_arn = aws_iam_policy.workspace_policy.arn
  role       = aws_iam_role.workspace_role.name
}

# Create the Directory Service Simple AD directory
resource "aws_directory_service_directory" "example-directory" {
  name     = var.service_directory_name
  password = "YourStrongPassword123!"
  type     = "SimpleAD"
  vpc_settings {
     vpc_id     = aws_vpc.example-vpc.id
    subnet_ids = [
      aws_subnet.public.id,
      aws_subnet.private.id
    ]
  }
  tags = {
    Name = "Example Directory"
  }
}

# resource "aws_workspaces_directory" "example_directory" {
#   directory_id     = aws_directory_service_directory.example-directory.id
#   tags             = var.name_tags
#   self_service_permissions {
#     change_compute_type    = true
#     increase_volume_size  = true
#     rebuild_workspace     = true
#     restart_workspace     = true
#     switch_running_mode   = true
#   }
#   depends_on = [
#     aws_directory_service_directory.example-directory,
#     aws_iam_role.workspaces_default_role,
#     aws_iam_role_policy_attachment.workspaces_default_role_policy_attachment
#   ]
# }

