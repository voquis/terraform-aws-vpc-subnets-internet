# ---------------------------------------------------------------------------------------------------------------------
# Permissions for writing flowlog log destination via IAM role attachment.
# Data Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
# ---------------------------------------------------------------------------------------------------------------------

data "aws_iam_policy_document" "assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "flowlog" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }
}
