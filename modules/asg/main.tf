resource "aws_launch_template" "lt" {
  name_prefix   = "${var.env}-lt"
  image_id      = var.ami
  instance_type = var.instance_type

  key_name = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.sg_id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              systemctl start apache2
              echo "Hello from $(hostname)" > /var/www/html/index.html
              EOF
  )
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity = 2
  max_size         = 3
  min_size         = 1

  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  target_group_arns = [var.tg_arn]

  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "${var.env}-asg"
    propagate_at_launch = true
  }
}