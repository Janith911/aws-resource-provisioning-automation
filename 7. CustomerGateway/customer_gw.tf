#Defining region for the Customer Gateway to be deployed
variable "region" {default = "ap-southeast-1"}

#Defining the provider as AWS
provider "aws" {
  region = "${var.region}"
}

#Provisioning resource (Customer Gateway)
resource "aws_customer_gateway" "my_customer_gw" {
  bgp_asn    = 65000
  ip_address = ""
  type       = "ipsec.1"

  tags = {
    Name = "my_customer_gw"
  }
}

