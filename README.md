# IAM + Policy Study

## Why?

- ISMS 해보니까... 정책은 만들어야겠더라...
- 유저를 만들어서 관리를 해보니, 유저당 모든 권한을 줄수는 없다.
- 필요한 권한을 줘야한다
- Resource "\*"는 재앙임...

## Policy Form

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Action": [],
      "Resource": [],
      "Condition": {}
    }
  ]
}
```

> Version

- 사용하고자 하는 정책언어의 버전
- 최신버전을 사용해야 함 (Require) => 2012-10-17 추후 바뀔수는 있음
- <a href="https://docs.aws.amazon.com/ko_kr/IAM/latest/UserGuide/reference_policies_elements_version.html"> 정책 version </a>

> Sid (Optional)

- 설명문
- 왠만하면 작성하자

> Effect

- Allow || Deny
- Policy내에서는 Allow, Deny 외에는 존재하지 않음
- 액세를 허용하는지, 거부하는지의 대한 여부를 뜻함

> Principal (일부상황에서만 필요) \*\*\*

- 리소스 기반 정책을 사용하는 경우, 액세스를 허용하거나 거부할계정 사용자, 역할 및 사용자를 표시해야 한다.
- IAM 권한 정책은 이 요소를 포함할 수 없음

> Action

- 정책이 허용하거나 거부하는 작업목록
- AWS Action

> Resource

- 해당 Action이 적용되는 자원의 종류
- "\*" 를 잘 사용하면 좋음
- "\*" 너무 남발하면 얻어맞음

> Condition

- 정책에서 권한을 부여하는 상황을 지정함

## Policy Terraform

- readonly-policy.tf
- only-ip.tf
- only-access-s3.tf

## Reference

- <a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/amazon-s3-policy-keys.html"> S3 Bucket Policy Example </a>
