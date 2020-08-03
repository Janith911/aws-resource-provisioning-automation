#Defining region, customer gateway ID and vpn gateway ID for the VPN tunnel to be deployed
variable "region" {default = "ap-southeast-1"}
variable "vpn_gw_id" {default = ""}
variable "customer_gw_id" {default = ""}

#Defining the provider as AWS
provider "aws" {
  region = "${var.region}"
}

#Provisioning resource (VPN Connection)
resource "aws_vpn_connection" "my_vpn_connection" {
  vpn_gateway_id      = var.vpn_gw_id
  customer_gateway_id = var.customer_gw_id
  type                = "ipsec.1"
  static_routes_only  = true
}