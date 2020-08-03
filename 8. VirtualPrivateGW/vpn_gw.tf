#Defining region for the Virtual Private Gateway to be deployed
variable "region" {default = "ap-southeast-1"}
variable "vpc_id" {default = ""}

#Defining the provider as AWS
provider "aws" {
  region = "${var.region}"
}

#Provisioning resource (Virtual Private Gateway)
resource "aws_vpn_gateway" "my_vpn_gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "my_vpn_gw"
  }
}