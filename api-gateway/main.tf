provider "aws" {
  region = var.aws_region
}

module "api_gateway"{
    source = "./module"
    name=var.name
    resource_path = var.resource_path
    integration_type = var.integration_type
    stage_name = var.stage_name
    Name=var.Name
    team = var.team
    env = var.env
    owner = var.owner
    owneremail = var.owneremail
    creationdate = var.creationdate
}