resource "aws_iam_policy" "only-ip" {
  name        = "only-ip"
  path        = "/"
  description = "only"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*"
        ]
        Effect   = "Allow"
        Resource = "*",

        ## 1.0.0.0/32 일때 모든 리소스를 허용함
        "Condition" : {
          "IpAddress" : {
            "aws:SourceIp" : [
              "1.0.0.0/32"
            ]
          }
        }
      }
    ]
  })
}
