resource "aws_instance" "name" {

ami = var.ec2_ami
instance_type = "t2.micro"
  
}