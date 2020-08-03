#Defining region and the subnet group for the RDS instance to be deployed
variable "region"                   { default = "ap-southeast-1" }
variable "vpc_id"                   { default = "" }
variable "vpc_cidr"                 { default = "10.0.0.0/16" }

#Defining the provider as AWS
provider "aws" {
    region = "${var.region}"
}

#Provisioning resource (Security group for Elastic Beanstalk)
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_HTTP"
  }
}

#Provisioning resource (Security group for RDS)
resource "aws_security_group" "allow_all_traffic" {
  name        = "allow_all"
  description = "Allow ALL inbound traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ALL"
  }
}