provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_web_server" {

  #change to latest AMI value
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.allow_http.name]
  user_data = "${file("init.sh")}"
  
    tags = {
    Name = "MyWebServer"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP traffic"

  #change to match your VPC ID
  vpc_id      = "vpc-07ac3bb79b3bb579a"

  ingress {
    description      = "HTTP Traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
