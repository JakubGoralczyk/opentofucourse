output "instance_arn" {
    description = "value"
    value = aws_instance.this.arn  
}

output "instance_url" {
    description = "Public IP URL of the instance"
    value = "http://${aws_instance.this.public_ip}"
}