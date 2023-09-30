provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "db" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-db"
  }
}




resource "aws_instance" "web" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"

  depends_on = [aws_instance.db]
}

data "aws_instance" "dbsearch" {
  filter {
    name   = "tag:Name"
    values = ["terraform-db"]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}
