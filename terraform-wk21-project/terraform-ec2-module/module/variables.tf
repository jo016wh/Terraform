# Input variables for ec2
variable "instance" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "amazon machine image for EC2 instance"
  type        = string
  default     = "ami-0b5eea76982371e91" # AZlinux2 - us-east-1
}