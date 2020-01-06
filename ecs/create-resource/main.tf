resource "aws_ecs_task_definition" "service" {
  family                = "${var.family}"
  container_definitions = "${var.container_definitions}"
  task_role_arn = "${var.task_role_arn}"
}

resource "aws_lb_target_group" "target_group" {
  name     = "${var.service_name}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  health_check {    
    healthy_threshold   = 5    
    unhealthy_threshold = 2    
    timeout             = 5    
    interval            = 30    
    path                = "${var.health_check_path}"    
    port                = "traffic-port"
    matcher             = "200-299"
  }
}

resource "aws_lb_listener_rule" "target_group_listener_rule" {
  listener_arn = "${data.aws_lb_listener.alb_https_listener.arn}"
  priority     = var.alb_rule_priority
  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group.arn}"
  }
  condition {
    field  = "path-pattern"
    values = ["${var.alb_rule_path}"]
  }
}

resource "aws_ecs_service" "service" {
  name            = "${var.service_name}"
  cluster         = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.service.arn}"
  desired_count   = var.desired_count
  load_balancer {
    target_group_arn = "${aws_lb_target_group.target_group.arn}"
    container_name   = "${var.container_name}"
    container_port   = "${var.container_port}"
  }
}