resource "aws_sqs_queue" "queue" {
  name                      = "${var.queue_name}-${var.environment}"
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
  redrive_policy            = "${var.redrive_policy}"
  visibility_timeout_seconds = var.visibility_timeout_seconds

  tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_sqs_queue_policy" "policy" {
  queue_url = "${aws_sqs_queue.queue.id}"
  policy = "${var.queue_policy}"
}