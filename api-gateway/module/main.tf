
resource "aws_api_gateway_rest_api" "first-api" {
 name = var.name    
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = aws_api_gateway_rest_api.first-api.id    
  parent_id   = aws_api_gateway_rest_api.first-api.root_resource_id    
  path_part   = var.resource_path 
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.first-api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "ANY"     
  authorization = "NONE"    
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id = aws_api_gateway_rest_api.first-api.id
  resource_id = aws_api_gateway_resource.resource.id
  http_method = aws_api_gateway_method.method.http_method
  integration_http_method = "ANY"        
  type                    = var.integration_type
}

resource "aws_api_gateway_deployment" "deploy-application" {
  rest_api_id = aws_api_gateway_rest_api.first-api.id
  depends_on = [ aws_api_gateway_integration.integration ]
  stage_name = var.stage_name
}

resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deploy-application.id
  rest_api_id   = aws_api_gateway_rest_api.first-api.id
  stage_name    = "dev"
  tags ={
    Name         = var.Name
    team         = var.team
    env          = var.env
    owner        = var.owner
    owneremail   = var.owneremail
    creationdate = var.creationdate
  }
}

resource "aws_api_gateway_usage_plan" "api-usage-plam" {
  name="my-usage-plan"
  api_stages {
    api_id = aws_api_gateway_rest_api.first-api.id
    stage = aws_api_gateway_stage.stage.stage_name
  }
  quota_settings {
    limit = 100
    period = "WEEK"
  }
  throttle_settings {
    burst_limit = 50  #maximum number of concurrent requests allowed.
    rate_limit = 20   #maximum number of requests allowed per second.
  }
}

# Execute terraform apply to apply the configuration, and the API Gateway URL will be displayed as an output.
# output "api_url" {
#   value = aws_api_gateway_deployment.example.invoke_url
# }