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

resource "aws_instance" "test" {
  ami = "ami-064ff912f78e3e561"
  instance_type = "t2.micro"
  tags = {
    Name = "From_TF"
  }
}
