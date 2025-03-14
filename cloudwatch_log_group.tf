# ---------------------------------------------------------------------------------------------------------------------
# Create CloudWatch log group for flowlog log destination and attach to IAM role.
# flowlogs will try to create a log group called /aws/flowlogs/<VPC name> if it doesn't exist.
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "this" {
  count             = var.flowlogs == true ? 1 : 0
  name              = "/aws/flowlogs/${var.name}"
  retention_in_days = var.log_retention_in_days
}
