# EC2 인스턴스 (My Subnet)
resource "aws_instance" "MyEC2" {
  ami           = "ami-0a463f27534bdf246"  # 예시로 Amazon Linux 2 AMI (리전마다 다를 수 있음)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.Mypublic.id
  vpc_security_group_ids = [aws_security_group.MySG.id]
  associate_public_ip_address = true
  key_name = "0401"
  tags = {
    Name = "MyEC2"
  }
}



# EC2 인스턴스 (ELB Subnet) - SERVER-1
resource "aws_instance" "ELBEC2-1" {
  ami           = "ami-0a463f27534bdf246"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.ELBpublic1.id
  vpc_security_group_ids = [aws_security_group.ELBSG.id]
  associate_public_ip_address = true
  key_name = "0401"
  tags = {
    Name = "SERVER-1"
  }
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd tree
    systemctl start httpd
    systemctl enable httpd

    echo "server-1" > /var/www/html/index.html
    mkdir -p /var/www/html/dev
    echo "server-1:dev" > /var/www/html/dev/index.html
    

    chown -R apache:apache /var/www/html
    chmod -R 755 /var/www/html
  EOF
}

# EC2 인스턴스 (ELB Subnet) - SERVER-2
resource "aws_instance" "ELBEC2-2" {
  ami           = "ami-0a463f27534bdf246"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.ELBpublic2.id
  vpc_security_group_ids = [aws_security_group.ELBSG.id]
  associate_public_ip_address = true
  key_name = "0401"
  tags = {
    Name = "SERVER-2"
  }
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd tree
    systemctl start httpd
    systemctl enable httpd

    echo "server-2" > /var/www/html/index.html
    mkdir -p /var/www/html/mgt
    echo "server-2:mgt" > /var/www/html/mgt/index.html

    chown -R apache:apache /var/www/html
    chmod -R 755 /var/www/html
  EOF
}

# EC2 인스턴스 (ELB Subnet) - SERVER-3
resource "aws_instance" "ELBEC2-3" {
  ami           = "ami-0a463f27534bdf246"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.ELBpublic2.id
  vpc_security_group_ids = [aws_security_group.ELBSG.id]
  associate_public_ip_address = true
  key_name = "0401"
  tags = {
    Name = "SERVER-3"
  }
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd tree
    systemctl start httpd
    systemctl enable httpd

    echo "server-3" > /var/www/html/index.html
    mkdir -p /var/www/html/mgt
    echo "server-3:mgt" > /var/www/html/mgt/index.html

    chown -R apache:apache /var/www/html
    chmod -R 755 /var/www/html
  EOF
}
