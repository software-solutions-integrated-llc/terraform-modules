output "repository_arn" {
  value = "${aws_ecr_repository.service.arn}"
}

output "repository_name" {
  value = "${aws_ecr_repository.service.name}"
}

output "repository_url" {
  value = "${aws_ecr_repository.service.repository_url}"
}