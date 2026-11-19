# ---------------------------------------------------------------------------------------------------------------------
# Create optional route for internet gateway and attach to main VPC route table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_route" "this" {
  count                  = var.internet_gateway == true ? 1 : 0
  route_table_id         = aws_vpc.this.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
}

resource "aws_route" "this_ipv6" {
  count                       = var.egress_only_internet_gateway == true ? 1 : 0
  route_table_id              = aws_vpc.this.default_route_table_id
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id      = aws_egress_only_internet_gateway.this[0].id
}
