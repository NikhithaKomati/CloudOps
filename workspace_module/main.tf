provider "aws" {
  region = "us-east-1"
}

resource "aws_directory_service_directory" "example" {
  name     = var.service_directory_name
  password = "set_your_password"
}

resource "aws_workspaces_directory" "example_directory" {
  directory_id     = aws_directory_service_directory.example.id
  directory_name   = var.workspace_directory_name
  tags=var.name_tags
}

data "aws_workspaces_bundle" "example_bundle" {
  name     = var.workspace_bundle_name
}

resource "aws_workspaces_workspace" "example_workspace" {
  directory_id = aws_workspaces_directory.example_directory.id
  bundle_id    = data.aws_workspaces_bundle.example_bundle.id
  user_name = "provide_user_name"
}