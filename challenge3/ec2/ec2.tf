variable "ec2_name" {
  type    = string
  default = "EC2Instance"
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "user_data" {
  type    = string
  default = ""
}

resource "aws_instance" "server" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.ec2_name
  }

  security_groups = var.security_groups
  user_data       = var.user_data
}

output "instance_id" {
  value = aws_instance.server.id
}

output "instance_private_ip" {
  value = aws_instance.server.private_ip
}
