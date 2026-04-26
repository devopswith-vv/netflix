resource "aws_lb" "alb" {
  name               = "${var.env}-alb"
  load_balancer_type = "application"
  subnets = var.subnet_ids

  security_groups = [var.sg_id]
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.env}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "tg1" {
  name     = "${var.env}-tg1"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = var.vpc_id
}

# resource "aws_lb_target_group_attachment" "attach" {
#   target_group_arn = aws_lb_target_group.tg.arn
#   target_id        = var.instance_id
#   port             = 80
# }

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}