# EC2 Module
resource "aws_instance" "appserver" {
  ami           = var.ami_id
  instance_type = var.instance

  tags = {
    Name = "appserver"
  }
}