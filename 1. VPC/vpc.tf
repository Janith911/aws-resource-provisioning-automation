#Defining region for the VPC to be deployed
variable "region" {default = "ap-southeast-1"}

#Defining the provider as AWS
provider "aws" {
  region = "${var.region}"
}

#Provisioning resource (VPC)
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "voiceiq"
  }
}