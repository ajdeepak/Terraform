
variable "vpccidr" {
  type = string

}

variable "instance_type" {
  type = string

}

variable "ami_id" {
  type = string

}
variable "public_subnet_cidr" {
  type = list(string)

}

variable "private_subnet_cidr" {
  type = list(string)

}

