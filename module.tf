module "subnet" {
  source = "./modules/subnet"
    vpc_id = aws_vpc.main_vpc.id
  subnet_cidr_block = var.subnet_cidr
  availability_zone = "${var.region}a"
  tags              = local.common_tags
}
#############################################
module "ec2" {
  source = "./modules/ec2"
  security_group_id = aws_security_group.main_vpc.id
  subnet_id = module.subnet.bahi_subent_id
  instance_count = 1
  instance_type = local.instance_type
  tags           = local.common_tags
  key_name         = local.key_name
  private_key_pem  = local.private_key_pem
  private_key_path = local.private_key_path 
}
###############################################
