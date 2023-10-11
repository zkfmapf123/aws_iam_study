## 특정 버킷만 전체허용
resource "aws_iam_policy" "only-access-s3" {
  name        = "only-access-s3"
  path        = "/"
  description = "only access s3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        // S3 전체
        Effect = "Allow"
        Action = [
          "*"
        ],
        Resource = "arn:aws:s3:::*",
      },
      {
        // 특정 S3만을 허용
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetBucketVersioning",
          "s3:GetBucketTagging",
          "s3:GetEncryptionConfiguration",
          "s3:GetIntelligentTieringConfiguration",
          "s3:GetBucketLogging",
          "cloudtrail:DescribeTrails",
          "s3:GetBucketNotificationConfiguration",
          "s3:GetAccelerateConfiguration",
          "s3:GetBucketObjectLockConfiguration",
          "s3:GetBucketRequestPayment",
          "s3:GetBucketWebsite",
          "s3:GetObject"
        ],
        Resource = "arn:aws:s3:::ecs-architecture",
      },
      {
        // 특정 S3만을 부정
        Effect = "Deny"
        Action = [
          "*"
        ],
        Resource = [
          "arn:aws:s3:::gsu-test-bucket",
          "arn:aws:s3:::jenkins-cicd-example",
          "arn:aws:s3:::leedonggyu-dev-cloud-trail",
          "arn:aws:s3:::leedonggyu-trail-bucket",
          "arn:aws:s3:::my-ecs-terraform",
          "arn:aws:s3:::pipeline-tfstate"
        ],
      },
    ]
  })
}
