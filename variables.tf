variable "vpc_id" {
  description = "Lab VPC"
  default     = "vpc-0772ccab150b0d8c3"
}

variable "key_pair" {
  description = "Lab VPC Key Pair Name"
  default     = "vockey"
}

variable "ami" {
  type    = string
  default = "ami-0cff7528ff583bf9a"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  description = "Public subnet 1 ID"
  default     = "subnet-0dd0342de8f1ca48c"
}

variable "user_data" {
  description = "User data provided in lab3"
  default     = <<EOT
#!/bin/bash
yum install httpd -y
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server!</h1></html>' >
/var/www/html/index.html
EOT
}