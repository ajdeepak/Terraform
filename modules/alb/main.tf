resource "aws_lb" "app_alb" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"

  subnets = var.public_subnet_ids

  security_groups = [
    var.alb_security_group_id
  ]

  tags = {
    Name = "app-alb"
  }
}


resource "aws_lb_target_group" "app_tg" {
  name     = "app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "app-target-group"
  }
}


resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}


resource "aws_lb_target_group_attachment" "app_attachment" {
  count = length(var.webapp_ids)

  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = var.webapp_ids[count.index]
  port             = 80
}