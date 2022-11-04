data "aws_vpc" "lab_vpc" {
  id = var.vpc_id
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

resource "aws_instance" "web_server" {
  ami                     = var.ami
  instance_type           = var.instance_type
  count = 1
  key_name                = var.key_pair
  subnet_id               = data.aws_subnet.selected.id
  disable_api_termination = true
  vpc_security_group_ids  = [aws_security_group.Web_Server_SG.id]
  user_data               = var.user_data

  tags = {
    Name = "Nick_Davis_EC2_Server"
  }
}

resource "aws_security_group" "Web_Server_SG" {
  name        = "Web Server Security Group"
  description = "web server security group"
  vpc_id      = data.aws_vpc.lab_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web Server Security Group"
  }
}