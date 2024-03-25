variable "ec2_ami" {
    description = "AMI ID"
    type = "string"
    default = "ami-05295b6e6c790593e" 
  
}

variable "ec2_inst_type" {
    description = "Instance_type"
    type = "string"
    default = "t2.micro" 
  
}