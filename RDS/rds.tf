#Defining region and the subnet group for the RDS instance to be deployed
variable "region"                   { default = "ap-southeast-1" }
variable "subnet_group_name"        { default = "" }
variable "sg_rds_id"                { default = "" }

#Defining the provider as AWS
provider "aws" {
    region = "${var.region}"
}

#Provisioning resource (RDS)
resource "aws_db_instance" "mydb" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t2.micro"
  name                    = "mydb"
  username                = "admin"
  password                = "346sdffwxcjjuy7hk"
  parameter_group_name    = "default.mysql5.7"
  db_subnet_group_name    = "${var.subnet_group_name}"
  vpc_security_group_ids  = ["${var.sg_rds_id}","${var.sg_rds_id}"]
}