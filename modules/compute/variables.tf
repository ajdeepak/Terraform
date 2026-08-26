variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID for Bastion host"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for webapp instances"
  type        = list(string)
}

variable "bastion_security_group_id" {
  description = "Security group ID for Bastion host"
  type        = string
}

variable "webapp_security_group_id" {
  description = "Security group ID for webapp instances"
  type        = string
}