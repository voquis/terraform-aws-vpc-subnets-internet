# ---------------------------------------------------------------------------------------------------------------------
# Create and attach IAM policy for flowlogs to write to and create CloudWatch log streams
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_iam_policy" "flowlog" {
  count  = var.flowlogs == true ? 1 : 0
  name   = var.log_policy_name
  policy = data.aws_iam_policy_document.flowlog.json
}
