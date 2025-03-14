# ---------------------------------------------------------------------------------------------------------------------
# If flowlogs requested, create cloudwatch log group destination and role
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_flow_log" "this" {
  count           = var.flowlogs == true ? 1 : 0
  iam_role_arn    = aws_iam_role.this[0].arn
  log_destination = aws_cloudwatch_log_group.this[0].arn
  traffic_type    = var.log_traffic_type
  vpc_id          = aws_vpc.this.id
  tags = {
    Name = var.flowlogs_name
  }
}
