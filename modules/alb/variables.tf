variable "vpc_id" {
  description = "VPC ID where ALB will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}



variable "target_instance_ids" {
  description = "List of EC2 instance IDs to attach to the target group"
  type        = list(string)
}

variable "webapp_ids" {
    type = lsit(string)
  
}