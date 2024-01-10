module "vpc" {
  source       = "./modules/vpc"
  region       = var.region
  project_name = var.project_name
}
module "ec2_instance" {
  source        = "./modules/ec2_Instance"
  instance_type = var.instance_type
  key_name      = var.key_name
  ami           = var.ami
}
module "codecommit" {
  source            = "./modules/codecommit"
  repository_name   = var.repository_name
  codecommit_branch = var.codecommit_branch
}
module "codedeploy" {
  source             = "./modules/codedeploy"
  compute_platform   = var.compute_platform
  codedeployapp_name = var.codedeployapp_name
  project_name       = var.project_name
}
module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}
module "codepipeline" {
  source             = "./modules/codepipeline"
  bucket_name        = var.bucket_name
  repository_name    = var.repository_name
  codecommit_branch  = var.codecommit_branch
  region             = var.region
  codedeployapp_name = var.codedeployapp_name
}