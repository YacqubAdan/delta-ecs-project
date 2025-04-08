resource "aws_vpc" "delta-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}
resource "aws_subnet" "delta-public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.delta-vpc.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.subnet_availability_zones[count.index]
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "delta-igw" {
  vpc_id = aws_vpc.delta-vpc.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "delta-rt" {
  vpc_id = aws_vpc.delta-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.delta-igw.id
  }
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.delta-public)
  subnet_id      = aws_subnet.delta-public[count.index].id
  route_table_id = aws_route_table.delta-rt.id
}


resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.delta-vpc.id
  name   = var.alb_sg_name

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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


resource "aws_security_group" "ecs_sg" {
  vpc_id = aws_vpc.delta-vpc.id
  name   = var.ecs_sg_name

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow traffic to app on port 3000"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}







