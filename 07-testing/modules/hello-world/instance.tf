resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

resource "aws_security_group" "instances" {
  name = "instance-security-group"
  vpc_id = aws_vpc.main.id
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id

  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.instances.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1" # All protocols
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_instance" "instance" {
  ami                    = "ami-011899242bb902164"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.instances.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              python3 -m http.server 8080 &
              EOF
}

output "instance_ip_addr" {
  value = aws_instance.instance.public_ip
}

