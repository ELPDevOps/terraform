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
  count         = var.instance_count

  tags = {
    Name = "server1"
  }
}

variable "instance_count" {
   description = "Instance type t2.micro"
   type        = number
   default     = "2"
}
