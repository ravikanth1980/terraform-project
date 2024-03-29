# create a VPC for my dev environment 
resource "aws_vpc" "dev_vpc" {

  cidr_block = var.dev_vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
        Name = var.vpc_name
  }
}
## Public subnet for my dev_vpc

resource "aws_subnet" "dev_public_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = var.dev_vpc_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.dev_public_subnet_az
  tags = {
    Name = "Public Subnet"
  }
}

## Private Subnet for dev_vpc

resource "aws_subnet" "dev_private_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = var.dev_vpc_private_subnet_cidr
  availability_zone = var.dev_private_subnet_az
  tags = {
    Name = "Private Subnet"
  }
}

## Internet Gateway for dev_vpc Public subnet instances

resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name = "Public Internet Gateway"
  }
}

# output "vpc_id" {
#   value = aws_vpc.dev_vpc.id
# }

# output "public_subnet_id" {
#   value = aws_subnet.dev_public_subnet.id
# }

# output "private_subnet_id" {
#   value = aws_subnet.dev_private_subnet.id
# }

# output "internet_gateway_id" {
#   value = aws_internet_gateway.dev_igw.id
# }
