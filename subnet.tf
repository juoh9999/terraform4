
# MY Public Subnet 생성
resource "aws_subnet" "Mypublic" {
  vpc_id                  = aws_vpc.My.id
  cidr_block              = "20.40.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "My-Public-Subnet"
  }
}

# ELB public Subnet 생성
resource "aws_subnet" "ELBpublic1" {
  vpc_id                  = aws_vpc.ELB.id
  cidr_block              = "10.40.1.0/24"
  availability_zone       = "ap-northeast-2a"
  tags = {
    Name = "ELB-PUBLIC-Subnet"
  }
}

resource "aws_subnet" "ELBpublic2" {
  vpc_id                  = aws_vpc.ELB.id
  cidr_block              = "10.40.2.0/24"
  availability_zone       = "ap-northeast-2c"
  tags = {
    Name = "ELB-PUBLIC-Subnet2"
  }
}

