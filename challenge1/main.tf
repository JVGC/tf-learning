terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "TerraformVPC" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = "TerraformVPC"
  }
}
