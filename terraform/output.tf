output "repository_url" {
  value = module.codecommit.repository_url
}

output "ec2_instance_public_dns" {
  value = module.ec2_instance.ec2_instance_public_dns
}

output "repository_name" {
  value = module.codecommit.repository_name
}

output "codedeploy_app_name" {
  value = module.codedeploy.codedeploy_app_name
}

output "codedeploy_deployment_group_name" {
  value = module.codedeploy.codedeploy_deployment_group_name
}