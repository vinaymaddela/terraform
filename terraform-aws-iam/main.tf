provider "aws" {
  region = "ap-south-2"
}

resource "aws_iam_user" "s3user" {
  name = "s3user"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "s3" {
  user = aws_iam_user.s3user.name
}

resource "aws_iam_user_policy" "s3_ro" {
  name = "s3bucketaccess"
  user = aws_iam_user.s3user.name

  policy = <<EOF
{
  "Id": "Policy1710333119696",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1710333117515",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "secret" {
  value = aws_iam_access_key.s3.encrypted_secret
}