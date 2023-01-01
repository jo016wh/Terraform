# EC2 Instance
resource "aws_instance" "web_server" {
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.ec2_instance_type
  availability_zone      = element(var.azs, count.index)
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  key_name               = "terraform-key"
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<html><body><div>Welcome to JW's Webpage!</div></body></html>" > /var/www/html/index.html
    EOF
}

# Creating subnets in Default VPC
resource "aws_default_subnet" "public_subnets" {
  count             = 3
  availability_zone = element(var.azs, count.index) # "count" is a meta-argument using an index to cycle incrementaly"
  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}