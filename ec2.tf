provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "web" {
  ami           = ami-0ab3794db9457b60a
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
