
## create a VPC for my dev environment 

resource "aws_vpc" "dev_vpc" {

  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev_vpc"
  }
}
## Public subnet for my dev_vpc

resource "aws_subnet" "dev_public_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Public Subnet"
  }
}

# ## create a VPC for my dev environment 

# resource "aws_vpc" "dev_vpc" {

#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "dev_vpc"
#   }
# }
# ## Public subnet for my dev_vpc

# resource "aws_subnet" "dev_public_subnet" {
#   vpc_id     = aws_vpc.dev_vpc.id
#   cidr_block = "10.0.1.0/24"
#   tags = {
#     Name = "Public Subnet"
#   }
# }


# ## Private Subnet for dev_vpc

# resource "aws_subnet" "dev_private_subnet" {
#   vpc_id     = aws_vpc.dev_vpc.id
#   cidr_block = "10.0.2.0/24"
#   tags = {
#     Name = "Private Subnet"
#   }
# }

# ## Internet Gateway for dev_vpc Public subnet instances

# resource "aws_internet_gateway" "dev_igw" {
#   vpc_id = aws_vpc.dev_vpc.id
#   tags = {
#     Name = "Publid-internet-gateway"
#   }
# }

# ## Route table for dev vpc Public and private subnet routes

# resource "aws_route_table" "dev_route" {
#   vpc_id = aws_vpc.dev_vpc.id
#   tags = {
#     Name = "dev_RTB"
#   }

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.dev_igw.id

#   }
#   route {
#     cidr_block = "10.0.1.0/24"
#     gateway_id = aws_nat_gateway.dev_natgateway.id

#   }
# }

# ## Public subnet association to dev route table

# resource "aws_route_table_association" "dev_public-server" {

#    subnet_id      = aws_subnet.dev_public_subnet.id
#    route_table_id = aws_route_table.dev_route.id
#  }
#   subnet_id      = aws_subnet.dev_public_subnet.id
#   route_table_id = aws_route_table.dev_route.id
# }


# ## Elastic IP for Natgateway

# resource "aws_eip" "dev_EIP" {
#   domain = "vpc"
#   tags = {
#     Name = "Elastic_IP"
#   }
# }

# ## Natgateway to provide internet for Private subnets

# resource "aws_nat_gateway" "dev_natgateway" {
#   allocation_id = aws_eip.dev_EIP.id
#   subnet_id     = aws_subnet.dev_public_subnet.id

#   tags = {
#     Name = "Natgatway-private"
#   }
# }

# ## Private Subnet asscoiation to dev Route table

# resource "aws_route_table_association" "dev_private-server" {
#   subnet_id      = aws_subnet.dev_private_subnet.id
#   route_table_id = aws_route_table.dev_route.id
# }
