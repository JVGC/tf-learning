variable "ec2_name" {
  type    = string
  default = "EC2Instance"
}


variable "server_names" {
  type = list(string)
}

resource "aws_instance" "server" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  count         = length(var.server_names)
  tags = {
    "Name" = var.server_names[count.index]
  }

}

output "instance_id" {
  value = [aws_instance.server.*.id]
}

output "instance_private_ip" {
  value = [aws_instance.server.*.private_ip]
}
