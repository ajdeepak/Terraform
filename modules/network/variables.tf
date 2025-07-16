variable "azs" { type = list(string) }
variable "vpccidr" {}
variable "public_subnet_cidr" { type = list(string) }
variable "private_subnet_cidr" { type = list(string) }
