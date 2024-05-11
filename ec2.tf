provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "web" {
  ami           = ami-03c3351e3ce9d04eb
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
