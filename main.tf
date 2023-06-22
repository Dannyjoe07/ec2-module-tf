resource "aws_instance" "ec2_create" {
  count                = var.instance_count
  instance_type        = var.instance_type
  ami                  = var.ami_id
  subnet_id            = var.subnet_id
  monitoring           = false
  iam_instance_profile = var.role_name
  tags = {
    Name = var.instance_name
  }
}

resource "aws_iam_role" "my_role" {
  name               = var.role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.my_role.name
  policy_arn = var.policy_arn
}

resource "aws_iam_role_policy_attachment" "attachment2" {
  role       = aws_iam_role.my_role.name
  policy_arn = var.policy_arn2
}

resource "aws_iam_instance_profile" "test_profile" {
  name = var.profile_name
  role = aws_iam_role.my_role.name
}
