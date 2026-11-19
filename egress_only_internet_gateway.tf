# ---------------------------------------------------------------------------------------------------------------------
# Create optional egress-only internet gateway
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/egress_only_internet_gateway
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_egress_only_internet_gateway" "this" {
  count  = var.egress_only_internet_gateway == true ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags = {
    Name = var.egress_only_internet_gateway_name
  }
}
