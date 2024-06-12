

This Terraform configuration sets up the following AWS resources:

    • IAM Role, Policy and attachement : Creates an IAM role and policy for the Amazon EKS cluster.
    • VPC and Subnets : Creates a VPC and public/private subnets for the EKS cluster.
    • EKS Cluster : Creates an Amazon EKS (Elastic Kubernetes Service) cluster.

1. created an aws vpc, subnet(1 public subnet and 1 private subnet)

2. created aws_eks_cluster (reate an Amazon Elastic Kubernetes Service (EKS) cluster)

  name (required)
  role_arn (required)
  vpc_config (required)
  depends_on (optional)


to run: 
        terraform init
        terraform plan
        terraform apply

to destroy:
           terraform destroy
