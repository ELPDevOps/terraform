resource "aws_instance" "webserver" {
  ami           = "ami-0a709bebf4fa9246f"
  instance_type = "t2.micro"
  associate_public_ip_address = var.enable_public_ip

  tags = {
    Name = "web"
  }
}

