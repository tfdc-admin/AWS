terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.keyID
  secret_key = var.secretKey
}

data "aws_ami" "k5" {
  most_recent = true

  filter {
    name   = "name"
    values = [amzn2-ami-kernel-5.10-hvm-2.0.20220316.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["849480946816"]
}

resource "aws_instance" "test" {
  ami = data.aws_ami.k5.id
  instance_type = "t2.micro"
  tags = {
    Name = "From_TF"
  }
}
