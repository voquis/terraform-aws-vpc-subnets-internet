# ---------------------------------------------------------------------------------------------------------------------
# Create optional internet gateway
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_internet_gateway" "this" {
  count  = var.internet_gateway == true ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags = {
    Name = var.internet_gateway_name
  }
}
