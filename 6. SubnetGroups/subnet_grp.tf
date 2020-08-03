#Defining region and the subnet group for the RDS instance to be deployed
variable "region"                   { default = "ap-southeast-1" }
variable "private_subnet_id_1"       { default = "" }
variable "private_subnet_id_2"       { default = "" }

#Defining the provider as AWS
provider "aws" {
    region = "${var.region}"
}

#Provisioning resource (Subnet Group)
resource "aws_db_subnet_group" "subnetgrp_for_rds" {
  name       = "rds_subnet_group"
  subnet_ids = [var.private_subnet_id_1, var.private_subnet_id_2]

  tags = {
    Name = "RDS_SubnetGroup"
  }
}