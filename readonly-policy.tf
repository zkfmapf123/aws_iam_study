resource "aws_iam_policy" "readonly-policy" {
  name        = "readonly-policy"
  path        = "/"
  description = "readonly"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ec2:Get*",
          "ec2:List*",
          "autoscaling-plans:Describe*",
          "autoscaling-plans:Get*",
          "elasticloadbalancing:Describe*",
          "autoscaling:Describe*",
          "autoscaling:Get*"
        ]
        Effect   = "Allow"
        Resource = "*",
      },
    ]
  })
}
