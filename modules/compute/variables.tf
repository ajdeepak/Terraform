variable "ami_id" {}
variable "instance_type" {}
variable "vpc_id" {}
variable "public_subnet_id" {}
variable "private_subnet_ids" {
  type = list(string)
}


variable "aws_security_group_id" {
  description = "ALB Security Group ID"
  type        = string
  default     = null
}
