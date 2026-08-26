output "bastion_public_ip" {
  description = "Public IP of the Bastion host"
  value       = aws_instance.bastion_host.public_ip
}

output "bastion_private_ip" {
  description = "Private IP of the Bastion host"
  value       = aws_instance.bastion_host.private_ip
}

output "bastion_id" {
  description = "Instance ID of the Bastion host"
  value       = aws_instance.bastion_host.id
}

output "webapp_private_ips" {
  description = "Private IPs of webapp instances"
  value       = [for instance in aws_instance.webapp : instance.private_ip]
}

output "webapp_ids" {
  description = "Instance IDs of webapp instances"
  value       = [for instance in aws_instance.webapp : instance.id]
}