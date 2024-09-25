resource "aws_instance" "this" {
    ami = ""

    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.wordpress.id]

    user_data = <<-EOF
                    yum update -y 
                    amazon-linux-extras install docker -y
                    service docekr start
                    useromd -a -G docker ec2-user
                    docker run -d -p 80:80 nginx
                    EOF

    tags = {
        Name = var.name_prefix
    }
}

resource "aws_security_group" "wordpress" {

    name = "${var.name_prefix}-wordpress"

    description = "Allow HTTP"
}