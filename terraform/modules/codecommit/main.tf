resource "aws_codecommit_repository" "Repository" {
  repository_name = var.repository_name
  description     = "This is the Sample App Repository"
  default_branch = var.codecommit_branch
}

