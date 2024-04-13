output "efs_id" {
    description = "The EFS ID of File system"
    value = aws_efs_file_system.efs.id
  }

output "security_id" {
    description = "Security Group ID"
    value = aws_security_group.efs-sg.id
}

output "subnet_ids" {
    description = "subnet for default vpc"
    value = var.subnet-ids
  
}
