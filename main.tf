provider "aws" {
  region  = "ap-southeast-1"
  version = "~> 1.2.0"
}

data "aws_iam_policy_document" "example" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]
  }

  statement {
    actions = [
      "s3:*",
    ]

    resources = []
  }
}

resource "aws_iam_policy" "example" {
  name   = "${var.name}"
  path   = "/"
  policy = "${data.aws_iam_policy_document.example.json}"

}


variable "name"{}
