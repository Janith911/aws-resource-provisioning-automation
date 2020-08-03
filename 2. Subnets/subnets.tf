#Defining region and the other essential variables for the required Subnets to be deployed
variable "region" {default = "ap-southeast-1"}
variable "vpc_id" {default = ""}
variable "AZ_a" {default = "ap-southeast-1a"}
variable "AZ_b" {default = "ap-southeast-1b"}
variable "AZ_c" {default = "ap-southeast-1c"}

#Defining the provider as AWS
provider "aws" {
  region = "${var.region}"
}

#Provisioning resource (Subents & Internet gateway)
resource "aws_subnet" "Public" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.AZ_a}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "Private1" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.AZ_b}"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Private1"
  }
}

resource "aws_subnet" "Private2" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "10.0.3.0/24"
  availability_zone = "${var.AZ_c}"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Private2"
  }
}

resource "aws_internet_gateway" "MyInternetGW" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "MyInternetGW"
  }
}