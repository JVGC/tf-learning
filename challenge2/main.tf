provider "aws" {
  region = "us-east-1"
}

variable "ports" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_instance" "db_server" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  tags = {
    "Name" = "DBServer"
  }
}

resource "aws_instance" "web_server" {
  ami             = "ami-03a6eaae9938c858c"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_server_sg.name]
  tags = {
    "Name" = "WebServer"
  }
  user_data = file("script.sh")


}

resource "aws_eip" "web_server_eip" {
  instance = aws_instance.web_server.id
}

resource "aws_security_group" "web_server_sg" {
  name = "Allow HTTP AND HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  dynamic "egress" {
    iterator = port
    for_each = var.ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


output "PrivateIP" {
  value = aws_instance.db_server.private_ip
}

output "WebServerPublicIP" {
  value = aws_eip.web_server_eip.public_ip
}
