data "aws_iam_policy_document" "codedeploy_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "CodeDepolyRole" {
  name               = "tf-codedeployrole"
  assume_role_policy = data.aws_iam_policy_document.codedeploy_assume_role.json
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeploy_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.CodeDepolyRole.name
}

resource "aws_codedeploy_app" "sampleApp" {
  compute_platform = var.compute_platform
  name             = var.codedeployapp_name
}

resource "aws_codedeploy_deployment_group" "sampleApp_deployment_group" {
  app_name              = aws_codedeploy_app.sampleApp.name
  deployment_group_name = "tf-SampleApp-deployment-group"
  service_role_arn      = aws_iam_role.CodeDepolyRole.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "tf-MySampleAppServer"
    }
  }
  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}