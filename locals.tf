locals {
  service_port = var.environment == "prod" ? 443 : 80
  instance_count = var.environment == "prod" ? 2 : 1    
  ingress_rules = [
    {
      port        = local.service_port
      description = "Service Port (${var.environment})"
    },
    {
      port        = 22
      description = "Management/SSH Port"
    }
  ]
  instance_type  = var.instance_type_map[var.environment]
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    Owner       = var.owner
  }
  key_name         = aws_key_pair.deployer.key_name
  private_key_pem  = tls_private_key.my_key.private_key_pem
  private_key_path = local_file.private_key.filename
}