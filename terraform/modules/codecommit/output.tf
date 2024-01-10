output "repository_arn" {
  value = aws_codecommit_repository.Repository.arn
}

output "repository_url" {
  value = aws_codecommit_repository.Repository.clone_url_http
}

output "repository_name" {
  value = aws_codecommit_repository.Repository.repository_name
}
