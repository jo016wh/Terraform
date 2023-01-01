
# In Default VPC  
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP In"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    description = "SSH from Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All Protocols
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "allow_http"
  }
}