resource "aws_security_group" "front_asg" {
  name        = "front_asg"
  description = "Allow traffic from load balancer to auto scaling group"
  vpc_id      = var.vpc_id

  ingress {
    description      = "HTTP traffic from load balancer to auto scaling group"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = [aws_security_group.front_lb.id]
  }

  ingress {
    description      = "HTTPS traffic from load balancer to auto scaling group"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All traffic to everywhere"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "front_asg"
  }
}




resource "aws_security_group" "front_lb" {
  name        = "front_lb"
  description = "Allow HTTP and HTTPS traffic to load balancer"
  vpc_id      = var.vpc_id

  ingress {
    description      = "HTTP traffic from internet to load balancer"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    description      = "HTTPS traffic from internet to load balancer"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All traffic to everywhere"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "front_lb"
  }
}

