
resource "aws_iam_user" "ec2_execution_user" {
  name = "ec2_execution_user"
  tags = {
    tag-key = "test"
  }
}

resource "aws_iam_access_key" "user_access_key" {
  user    = aws_iam_user.ec2_execution_user.name
  pgp_key = var.pgp_key
}

resource "aws_iam_user_policy" "ec2_execution_user_role" {
  name = "ec2_execution_user_role"
  user = aws_iam_user.ec2_execution_user.name

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Action : [
          "ec2:*"
        ],
        Effect : "Allow",
        Resource : "*"
      }
    ]
  })
}
