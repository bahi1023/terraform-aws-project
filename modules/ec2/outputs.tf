output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.main[*].id
}

output "instance_ips" {
  description = "The public IPs of the created instances"
  value       = aws_instance.main[*].public_ip
}