output "codedeploy_app_arn" {
  value = aws_codedeploy_app.sampleApp.arn
}

output "codedeploy_app_application_id" {
  value = aws_codedeploy_app.sampleApp.application_id
}

output "codedeploy_app_name" {
  value = aws_codedeploy_app.sampleApp.name
}

output "codedeploy_servicerole_arn" {
  value = aws_iam_role.CodeDepolyRole.arn
}

output "codedeploy_deployment_group_name" {
  value = aws_codedeploy_deployment_group.sampleApp_deployment_group.deployment_group_name
}