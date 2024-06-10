created an aws vpc, subnet, 1 public subnet and 1 private subnet

created aws_eks_cluster (reate an Amazon Elastic Kubernetes Service (EKS) cluster)

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