# Terraform Block
terraform {
  required_version = ">= 1.0" # any version greater than
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Provider Block
provider "aws" {
  region = "us-east-1"
}


