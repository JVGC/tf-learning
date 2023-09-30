variable "instance_id" {
  type = string
}

resource "aws_eip" "web_server_eip" {
  instance = var.instance_id
}


output "public_ip" {
  value = aws_eip.web_server_eip.public_ip
}
