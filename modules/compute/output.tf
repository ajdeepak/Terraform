output "bastion_public_ip" {
  description = "Public IP of the bastion host"
  value       = aws_instance.bastion_host.public_ip
}

output "bastion_private_ip" {
  description = "Private IP of the bastion host"
  value       = aws_instance.bastion_host.private_ip
}

output "webapp_private_ips" {
  description = "Private IPs of the webapp instances in private subnets"
  value       = [for instance in aws_instance.webapp : instance.private_ip]
}

output "webapp_ids" {
  description = "Instance IDs of webapp instances"
  value       = [for instance in aws_instance.webapp : instance.id]
}

output "public_sg_id" {
  description = "Security Group ID for public instances"
  value       = aws_security_group.public_sg.id
}

output "private_sg_id" {
  description = "Security Group ID for private instances"
  value       = aws_security_group.private_sg.id
}
