variable "ec2_ami" {
    description = "AMI ID"
    type = string
    default = "ami-0a70b9d193ae8a799"
  
}

variable "ec2_inst_type" {
    description = "Instance_type"
    type = string
    default = "t2.micro" 
 }

variable "tag_name" {
    description = "tag_name"
    type = string
    default = "dev-ec2-instance"
  
}
