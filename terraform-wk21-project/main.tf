terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "ec2" {
  source  = "./module"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
}