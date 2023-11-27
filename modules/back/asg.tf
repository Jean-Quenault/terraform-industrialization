resource "aws_autoscaling_group" "back" {

  desired_capacity     = 1
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = var.subnets
  
  launch_template {
    id      = aws_launch_template.back.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.backtg.arn]
}
