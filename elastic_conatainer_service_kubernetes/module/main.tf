

# IAM Role and Policy
resource "aws_iam_role" "eks_cluster_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "eks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

# Create an IAM policy for eks
resource "aws_iam_policy" "eks_policy" {
  name        = var.eks_iam_policy_name
  description = "IAM policy for eks"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "eks:PutRecord",
          "eks:PutRecordBatch"
        ],
        "Resource" : "*"
      }
    ]
  })
}

# Attach the IAM policy to the IAM role
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = aws_iam_policy.eks_policy.arn
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = aws_iam_policy.eks_policy.arn
}

#VPC Resources
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "first-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  for_each   = var.public_subnet_cidr
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = each.value
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each   = var.private_subnet_cidr
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = each.value
  tags = {
    Name = "private subnet"
  }
}

resource "aws_eks_cluster" "example_cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = concat([for subnet in aws_subnet.public_subnet : subnet.id], [for subnet in aws_subnet.private_subnet : subnet.id])
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy,
  ]
  tags = var.name_tags
}
