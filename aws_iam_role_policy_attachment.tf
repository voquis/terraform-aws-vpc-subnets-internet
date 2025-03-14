# ---------------------------------------------------------------------------------------------------------------------
# Attach flowlog permissions policy to role
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "this" {
  count      = var.flowlogs == true ? 1 : 0
  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.flowlog[0].arn
}
