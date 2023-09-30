provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "db" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
}


resource "aws_instance" "web" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"

  depends_on = [aws_instance.db]
}
