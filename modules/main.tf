provider "aws" {
  region = "us-east-1"
}


module "ec2_module" {
  source   = "./ec2"
  ec2_name = "name_from_module"
}

output "ec2_instance_id" {
  value = module.ec2_module.instance_id
}
