output "alb_security_group_id" {
  description = "Security group ID for the ALB"
  value       = aws_security_group.alb_sg.id
}

output "bastion_security_group_id" {
  description = "Security group ID for the Bastion host"
  value       = aws_security_group.bastion_sg.id
}

output "webapp_security_group_id" {
  description = "Security group ID for private webapp instances"
  value       = aws_security_group.webapp_sg.id
}