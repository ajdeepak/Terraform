resource "aws_instance" "bastion_host" {
  subnet_id                   = var.public_subnet_id
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = "Test_Keypair"
  associate_public_ip_address = true

  vpc_security_group_ids = [
    var.bastion_security_group_id
  ]

  tags = {
    Name = "bastion-host"
  }
}


resource "aws_instance" "webapp" {
  count = length(var.private_subnet_ids)

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.private_subnet_ids[count.index]

  key_name = "Test_Keypair"

  vpc_security_group_ids = [
    var.webapp_security_group_id
  ]

  tags = {
    Name = "webapp-${count.index + 1}"
  }
}