data "aws_acm_certificate" "certificate_front_arn" {
  domain   = "front.jeanops.net"
  statuses = ["ISSUED"]
}

resource "aws_lb" "front" {
  name               = "front"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.front.id]
  subnets            = [aws_subnet.euw3_az2.id, aws_subnet.euw3_az1.id, aws_subnet.euw3_az3.id]
  enable_deletion_protection = false
}

resource "aws_subnet" "euw3_az2" {
  vpc_id            = var.vpc_id
  availability_zone = "eu-west-3b"
}

resource "aws_subnet" "euw3_az1" {
  vpc_id            = var.vpc_id
  availability_zone = "eu-west-3a"
}

resource "aws_subnet" "euw3_az3" {
  vpc_id            = var.vpc_id
  availability_zone = "eu-west-3c"
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.front.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = var.certificate_front 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_tg.arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.front.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
      path        = "/#{path}"
      query       = "#{query}"
    }
  }
}

/* resource "aws_lb_target_group" "front_tg" {
  
} */
