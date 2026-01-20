################################
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Manual-VPC"
  }
}
#############################
resource "aws_security_group" "main_vpc" {
  name        = "app-sg-${var.environment}"
  description = "Security Group managed by Terraform"
  vpc_id      = aws_vpc.main_vpc.id
  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#########################
      resource "tls_private_key" "my_key" {
      algorithm = "RSA"
      rsa_bits  = 4096
      }
      resource "aws_key_pair" "deployer" {
      key_name   = "my-terraform-key"
      public_key = tls_private_key.my_key.public_key_openssh
      }
      resource "local_file" "private_key" {
      content         = tls_private_key.my_key.private_key_pem
      filename        = "${path.module}/my-terraform-key.pem"
      file_permission = "0400" # secure permission
      }

########################
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main-igw"
  }
}
###########################
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}
################################
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = module.subnet.bahi_subent_id
  route_table_id = aws_route_table.public_rt.id
}
