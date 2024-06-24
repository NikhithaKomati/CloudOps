
provider "aws" {
  region = var.aws_region
}

module "kinesis-firehose"{
    source = "./module"
    firehose_iam_role_name=var.firehose_iam_role_name
    firehose_iam_policy_name=var.firehose_iam_policy_name
    firehose_policy_attachment_name=var.firehose_policy_attachment_name
    s3_bucket_name=var.s3_bucket_name
    firehose_kinesis_delivery_stream_name=var.firehose_kinesis_delivery_stream_name
    tag_name=var.tag_name
    team = var.team
    env = var.env
    owner =var.owner
    owneremail = var.owneremail
    creationdate = var.creationdate
    lambda_iam_role = var.lambda_iam_role
    path_to_zipfile = var.path_to_zipfile
    file_Name =var.file_Name
    function_name = var.function_name
    lambda_function_runtime = var.lambda_function_runtime
}