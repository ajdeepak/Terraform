variable "vpc_id" {
  description = "VPC ID where ALB will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB"
  type        = list(string)
}

variable "webapp_ids" {
  description = "List of EC2 instance IDs to attach to target group"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for ALB"
  type        = string
}