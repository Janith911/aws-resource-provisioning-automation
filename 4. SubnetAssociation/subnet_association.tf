#Defining region and the other essential variables for the required Subnet association to be deployed
variable "region" {default = "ap-southeast-1"}
variable "public_subnet_id" {default = ""}
variable "rt_id" {default = ""}

#Defining the provider as AWS
provider "aws" {
  region = "${var.region}"
}

#Provisioning resource (Subnet association)
resource "aws_route_table_association" "a" {
  subnet_id      = "${var.public_subnet_id}"
  route_table_id = "${var.rt_id}"
}