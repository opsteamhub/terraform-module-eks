#####PUBLIC SUBNET######

resource "aws_subnet" "eks_subnet_public_1a" {

  vpc_id                  = aws_vpc.eks_vpc.id
  #cidr_block              = "10.10.16.0/24"
  cidr_block              = replace(var.cidr_block, "16.0/21", "16.0/24")
  availability_zone       = format("%sa", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name                                  = format("%s-subnet-public-1a", local.name)
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/elb"              = "1"
  }

}

resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  #cidr_block              = "10.10.17.0/24"
  cidr_block              = replace(var.cidr_block, "16.0/21", "17.0/24")
  availability_zone       = format("%sb", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name                                  = format("%s-subnet-public-1b", local.name)
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/elb"              = "1"
  }

}

resource "aws_subnet" "eks_subnet_public_1c" {
  vpc_id                  = aws_vpc.eks_vpc.id
  #cidr_block              = "10.10.18.0/24"
  cidr_block              = replace(var.cidr_block, "16.0/21", "18.0/24")
  availability_zone       = format("%sc", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name                                  = format("%s-subnet-public-1c", local.name)
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/elb"              = "1"
  }

}

resource "aws_route_table_association" "eks_public_rt_association_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.eks_public_rt.id
}

resource "aws_route_table_association" "eks_public_rt_association_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_1b.id
  route_table_id = aws_route_table.eks_public_rt.id
}

resource "aws_route_table_association" "eks_public_rt_association_1c" {
  subnet_id      = aws_subnet.eks_subnet_public_1c.id
  route_table_id = aws_route_table.eks_public_rt.id
}



###### PRIVATE SUBNET#######


resource "aws_subnet" "eks_subnet_private_1a" {

  vpc_id            = aws_vpc.eks_vpc.id
  #cidr_block        = "10.10.19.0/24"
  cidr_block        = replace(var.cidr_block, "16.0/21", "19.0/24")
  availability_zone = format("%sa", var.region)

  tags = {
    Name                                  = format("%s-subnet-private-1a", local.name)
    "kubernetes.io/cluster/${local.name}" = "shared"
  }

}

resource "aws_subnet" "eks_subnet_private_1b" {

  vpc_id            = aws_vpc.eks_vpc.id
  #cidr_block        = "10.10.20.0/24"
  cidr_block        = replace(var.cidr_block, "16.0/21", "20.0/24")
  availability_zone = format("%sb", var.region)

  tags = {
    Name                                  = format("%s-subnet-private-1b", local.name)
    "kubernetes.io/cluster/${local.name}" = "shared"
  }

}

resource "aws_subnet" "eks_subnet_private_1c" {

  vpc_id            = aws_vpc.eks_vpc.id
  #cidr_block        = "10.10.21.0/24"
  cidr_block        = replace(var.cidr_block, "16.0/21", "21.0/24")
  availability_zone = format("%sc", var.region)

  tags = {
    Name                                  = format("%s-subnet-private-1c", local.name)
    "kubernetes.io/cluster/${local.name}" = "shared"
  }

}

resource "aws_route_table_association" "eks_private_rt_association_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_nat_rt.id
}

resource "aws_route_table_association" "eks_private_rt_association_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_nat_rt.id
}

resource "aws_route_table_association" "eks_private_rt_association_1c" {
  subnet_id      = aws_subnet.eks_subnet_private_1c.id
  route_table_id = aws_route_table.eks_nat_rt.id
}