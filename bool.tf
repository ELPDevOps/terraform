terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}


resource "aws_instance" "webserver" {
  ami           = "ami-069d73f3235b535bd"
  instance_type = "t2.micro"
  count         = 1
  associate_public_ip_address = var.enable_public_ip

  tags = {
    Name = "webserver1"
  }
}

variable "enable_public_ip" {
   description = "ip enable"
   type        = bool
   default     = true
}
