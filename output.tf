output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "webapp_instance_ids" {
  value = module.compute.webapp_ids
}

output "webapp_private_ips" {
  value = module.compute.webapp_private_ips
}

output "bastion_instance_id" {
  value = module.compute.bastion_id
}

output "bastion_public_ip" {
  value = module.compute.bastion_public_ip
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_security_group_id" {
  value = module.security.alb_security_group_id
}

output "webapp_security_group_id" {
  value = module.security.webapp_security_group_id
}

output "bastion_security_group_id" {
  value = module.security.bastion_security_group_id
}