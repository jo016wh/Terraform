# Input Variables
# AWS Region
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

# AWS EC2 Instance Type
variable "ec2_instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "Key Pair associated with EC2 Instances"
  type        = string
  default     = "terraform-key"
}

# EC2 AMI
variable "ami_id" {
  type        = string
  description = "Default EC2 AMI ID"
  default     = "ami-0b5eea76982371e91"
}

# User Data
variable "user_data_replace" {
  default = true
}

# EC2 Count
variable "instance_count" {
  description = "Create x instances"
  type        = number
  default     = 3
}


# Security Group CIDR
variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

# VPC Public Subnet
variable "public_subnet" {
  type    = list(string)
  default = []
}

# VPC Public Subnet CIDR
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = []
}

# VPC Availabilty Zones
variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}