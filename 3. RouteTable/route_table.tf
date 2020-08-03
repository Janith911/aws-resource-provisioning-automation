#Defining region and the other essential variables for the required Route table to be deployed
variable "region" {default = "ap-southeast-1"}
variable "vpc_id" {default = ""}
variable "igw_id" {default = ""}

#Defining the provider as AWS
provider "aws" {
  region = "${var.region}"
}

#Provisioning resource (Route Table)
resource "aws_route_table" "Public_RT" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"
  }

  tags = {
    Name = "Public_RT"
  }
}