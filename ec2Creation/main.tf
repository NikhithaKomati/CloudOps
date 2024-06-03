provider "aws" {
    region = "us-east-2"
    access_key = "access_key"
    secret_key = "secret_key"  
}

resource "aws_instance" "first-ec2" {
    ami = "ami-09040d770ffe2224f"
    instance_type = "t2.micro"
    tags ={
        Name = "first ec2"
    }
}


