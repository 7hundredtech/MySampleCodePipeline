data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "tf_ec2_role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}
resource "aws_iam_role_policy_attachment" "AWSEC2_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
  role       = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "AWSEC2_Policy2" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.ec2_role.name
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "tf_ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "my_ec2_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name
  user_data                   = file("./ec2.sh")
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name
  tags = {
    Name    = "tf-MySampleAppServer"

  }
}