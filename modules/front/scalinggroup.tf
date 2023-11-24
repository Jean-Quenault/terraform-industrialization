resource "aws_autoscaling_group" "front" {

  desired_capacity     = 1
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = [var.subnet]
  
  launch_template {
    id      = aws_launch_template.front.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.front_tg.arn]
}
