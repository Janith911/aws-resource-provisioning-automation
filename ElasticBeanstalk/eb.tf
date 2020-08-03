#Defining region, VPC ID and Public subnet ID for the Web application to be deployed
variable "vpc_id" {default = ""}
variable "region" {default = "ap-southeast-1"}
variable "public_subnet" {default = ""}


#Defining the provider as AWS
provider "aws" {
  region = "${var.region}"
}


#Provisioning resource
resource "aws_elastic_beanstalk_application" "hello-world" {
  name        = "hello-world"
  description = "Test of beanstalk deployment"
}

resource "aws_elastic_beanstalk_environment" "hello-world" {
  name = "hello-world"
  application = "hello-world"
  solution_stack_name = "64bit Amazon Linux 2 v3.0.3 running Docker"
  cname_prefix = "hello-world"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "VPCId"
    value = "${var.vpc_id}"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "true"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = "${var.public_subnet}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
  }


}