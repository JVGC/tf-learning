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

variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "sshport" {
  type    = number
  default = 22
}

//bool
variable "enabled" {
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["myfirstvpc", "2"]
}

variable "mymap" {
  type = map(any)
  default = {
    Key1 = "1"
    Key2 = "2"
  }
}

variable "inputname" {
  type        = string
  description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.inputname
  }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["hello", 1, "world"]
}

variable "myobj" {
  type = object({
    name = string,
    port = list(number)
  })
  default = {
    name = "JVGC",
    port = [22, 5432, 80]
  }
}
