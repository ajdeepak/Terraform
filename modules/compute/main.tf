resource "aws_instance" "bastion_host" {
  subnet_id                   = var.public_subnet[0].id
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = "Test_Keypair"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.public_sg.id]

}


resource "aws_instance" "webapp" {
  count                  = length(var.private_subnet_ids)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[count.index].id
  key_name               = "Test_Keypair"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
}

resource "aws_security_group" "public_sg" {
  vpc_id      = var.vpc_id
  description = "this is public security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "private_sg" {
  vpc_id      = var.vpc_id
  description = "this is private security group"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }


  ingress {
     from_port       = 22
    to_port         = 22
    protocol        = "tcp" 
    security_groups = [var.aws_security_group_id]
      }

  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
