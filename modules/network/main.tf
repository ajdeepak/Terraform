resource "aws_vpc" "prodvpc" {
  cidr_block = var.vpccidr
  tags = {
    Name = "prodvpc"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.prodvpc.id
  map_public_ip_on_launch = true
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = var.azs[count.index]

  tags = {
    Name = "public-${var.azs[count.index]}"

  }
}


resource "aws_subnet" "private_subnet" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.prodvpc.id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]


  tags = {
    Name = "private-${var.azs[count.index]}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prodvpc.id

}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.prodvpc.id

  tags = {
    Name = "public-route-table"
  }

}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

}

resource "aws_route_table_association" "public_assocaiation" {
  count          = length(aws_subnet.public_subnet)
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet[count.index].id


}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat-gtw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags = {
    Name = "main-nat"
  }

}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.prodvpc.id

  tags = {
    Name = "private-route-table"
  }

}


resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gtw.id

}

resource "aws_route_table_association" "private_assocaiation" {
  count          = length(aws_subnet.private_subnet)
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet[count.index].id


}
