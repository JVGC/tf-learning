provider "aws" {
  region = "us-east-1"
}

variable "ports" {
  type    = list(number)
  default = [80, 443]
}
module "web_server" {
  source          = "./ec2"
  ec2_name        = "WebServer"
  security_groups = [module.web_server_sg.name]
  user_data       = file("script.sh")
}

module "db_server" {
  source   = "./ec2"
  ec2_name = "DBServer"
}

module "web_server_eip" {
  source      = "./eip"
  instance_id = module.web_server.instance_id
}

module "web_server_sg" {
  source        = "./sg"
  ingress_ports = var.ports
  egress_ports  = var.ports
}

output "PrivateIP" {
  value = module.db_server.instance_private_ip
}

output "WebServerPublicIP" {
  value = module.web_server_eip.public_ip
}
