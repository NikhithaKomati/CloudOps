This Terraform configuration sets up an API Gateway in AWS, including the following resources:

- API Gateway REST API
- API Gateway Resource
- API Gateway Method
- API Gateway Integration
- API Gateway Deployment
- API Gateway Stage

1. first I have created (aws_api_gateway_rest_api)  with first-api name
   name  --> required (taken from the variable.tf)

-----------------------

2.  created another resource (aws_api_gateway_resource) with resource (name)
  => resource represents a specific path or endpoint within the API Gateway.

   rest_api_id (required) --> sets the id of rest_api to rest_api_id
   parent_id   (required) --> specify the parent resource of the new API Gateway resource being created. path /
   path_part   (required) --> represents the specific path component for the resource.

-----------------------------

3.  created another resource (aws_api_gateway_method) with name method
   => resource represents an HTTP method (e.g., GET, POST, PUT, DELETE) that is associated with a specific API Gateway resource.

   rest_api_id (required)
   resource_id (required)
   http_method (required) -->  handle any HTTP method (GET, POST, PUT, DELETE, etc.)
   authorization (required) -->  no authorization is required to access this method.

------------------

4.  created another resource (aws_api_gateway_integration) with name integration
   => resource represents an integration between the API Gateway and an external service or resource.

   rest_api_id (required) 
   resource_id (required)
   http_method (required)
   integration_http_method (optional) --> it can handle any HTTP method (GET, POST, PUT, DELETE, etc.).
   type  (required)
   uri (optional)
   request_parameters

---------------

5.  created another resource (aws_api_gateway_deployment) with name deploy-application
    
    rest_api_id (required)
    depends_on (optional)
    stage_name (optional)

------------

6.  created another resource (aws_api_gateway_stage) with name stage

   deployment_id (required)
   rest_api_id (required)
   stage_name (required)
   tags (optional)

