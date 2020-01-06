data "aws_lb" "command_query_alb" {
  name = "command-query-alb-${var.environment}"
}

data "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = "${data.aws_lb.command_query_alb.arn}"
  port              = 443
}