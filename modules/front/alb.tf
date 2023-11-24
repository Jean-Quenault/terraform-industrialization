data "aws_acm_certificate" "certificate_front_arn" {
  domain   = "front.jeanops.net"
  statuses = ["ISSUED"]
}

resource "aws_lb" "front" {
  name               = "front"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.front_lb.id]
  subnets            = var.subnets
  enable_deletion_protection = false
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.front.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = var.certificate_front 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fronttg.arn
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

resource "aws_lb_target_group" "fronttg" {
  name     = "fronttg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
