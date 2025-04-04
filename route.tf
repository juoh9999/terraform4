
# Internet Gateway 생성
resource "aws_internet_gateway" "MyIGW" {
  vpc_id = aws_vpc.My.id
  tags = {
    Name = "My-IGW"
  }
}

resource "aws_internet_gateway" "ELBIGW" {
  vpc_id = aws_vpc.ELB.id
  tags = {
    Name = "ELB-IGW"
  }
}


# My Public Route Table 생성
resource "aws_route_table" "Mypublic" {
  vpc_id = aws_vpc.My.id
  tags = {
    Name = "MyPublicRT"
  }
}
resource "aws_route_table" "ELBpublic" {
  vpc_id = aws_vpc.ELB.id
  tags = {
    Name = "ELBPublicRT"
  }
}


# Public Route Table에 인터넷 게이트웨이 연결
resource "aws_route" "Myroute" {
  route_table_id         = aws_route_table.Mypublic.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.MyIGW.id
}

resource "aws_route" "ELBroute" {
  route_table_id         = aws_route_table.ELBpublic.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ELBIGW.id
}


# Public Subnet에 Public Route Table 연결
resource "aws_route_table_association" "Myassoc" {
  subnet_id      = aws_subnet.Mypublic.id
  route_table_id = aws_route_table.Mypublic.id
}

resource "aws_route_table_association" "ELBassoc1" {
  subnet_id      = aws_subnet.ELBpublic1.id
  route_table_id = aws_route_table.ELBpublic.id
}

resource "aws_route_table_association" "ELBassoc2" {
  subnet_id      = aws_subnet.ELBpublic2.id
  route_table_id = aws_route_table.ELBpublic.id
}



