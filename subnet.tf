# ---------------------------------------------------------------------------------------------------------------------
# Create subnets in VPC
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_subnet" "this" {
  count                   = length(var.subnets)
  availability_zone_id    = var.subnets[count.index].availability_zone
  cidr_block              = var.subnets[count.index].cidr_block
  map_public_ip_on_launch = var.subnets[count.index].map_public_ip_on_launch
  tags = {
    Name = var.subnets[count.index].name
  }
  vpc_id = aws_vpc.this.id
}
