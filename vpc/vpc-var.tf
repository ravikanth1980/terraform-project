variable "dev_vpc_cidr" {
    type = string
  }

variable "dev_vpc_subnet_cidr" {
    type = string
  }

  variable "dev_vpc_private_subnet_cidr" {
    type = string
  }

  variable "vpc_name" {
  description = "Name tag for the VPC"
  type = string
}

 variable "dev_public_subnet_az" {
  description = "Availability zone for the public subnet"
  type = string
}

variable "dev_private_subnet_az" {
  description = "Availability zone for the private subnet"
  type = string
}

