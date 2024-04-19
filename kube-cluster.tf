# # Define provider (AWS)
# provider "aws" {
#   region = "us-west-2"
# }

# EC2 instance for master node
resource "aws_instance" "master" {
  ami                    = "ami-0f7197c592205b389"
  instance_type          = "t2.medium" # Change as needed
  subnet_id              = data.aws_subnet.default.id
  vpc_security_group_ids = [data.aws_security_group.default.id]
  key_name               = aws_key_pair.private_key_pair.key_name
  user_data              = file("master_user_data.sh") # Provide path to your master user data script
  tags = {
    Name = "k8s-master"
  }
}

data "aws_vpc" "default" {
    default = true
}

data "aws_subnet" "default"{
    vpc_id = data.aws_vpc.default.id
    depends_on = [ data.aws_vpc.default ]
    availability_zone = "us-west-2b"
}

data "aws_security_group" "default" {
  name   = "default"
}
# EC2 instance for worker node
resource "aws_instance" "worker" {
  ami                    = "ami-0f7197c592205b389"
  instance_type          = "t2.micro" # Change as needed
  subnet_id              = data.aws_subnet.default.id
  vpc_security_group_ids = [data.aws_security_group.default.id]
  key_name               = aws_key_pair.private_key_pair.key_name
  user_data              = file("worker_user_data.sh") # Provide path to your worker user data script
  tags = {
    Name = "k8s-worker"
  }
}
