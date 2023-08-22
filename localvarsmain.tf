locals {
  env_name = "production"
}

resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.env_name}-vpc-tag"
  }
}

resource "aws_subnet" "staging-subnet" {
  vpc_id     = aws_vpc.staging-vpc.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.env_name}-subnet-tag"
  }
}

resource "aws_instance" "ec2_example" {

  ami           = "ami-0a709bebf4fa9246f"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.staging-subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "${local.env_name} - Terraform EC2"
  }
}

output "instanceip" {
  value = aws_instance.ec2_example.private_ip
}
