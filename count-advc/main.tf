provider "aws" {
  region = "us-east-1"
}


module "db" {
  source       = "./ec2"
  server_names = ["db", "db2", "db3"]
}

output "private_ips" {
  value = module.db.instance_private_ip
}
