variable "ingress_ports" {
  type    = list(number)
  default = [80, 443]
}

variable "egress_ports" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_security_group" "web_server_sg" {
  name = "Allow HTTP AND HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  dynamic "egress" {
    iterator = port
    for_each = var.egress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "name" {
  value = aws_security_group.web_server_sg.name
}
