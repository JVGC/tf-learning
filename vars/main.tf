provider "aws" {
  region = "us-east-1"
}

variable "numbers_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  count         = var.numbers_of_servers
}

