resource "aws_instance" "name" {

ami = var.ec2_ami
instance_type = var.ec2_inst_type
  
}