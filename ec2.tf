resource "aws_instance" "name" {

ami = "ami-0a70b9d193ae8a799"
instance_type = "t2.micro"
 tags = {
    
    Name = "My-ec2-instance"
 }  
}