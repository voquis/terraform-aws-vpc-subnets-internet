# ---------------------------------------------------------------------------------------------------------------------
# Create subnets in VPC
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_subnet" "this" {
  count                                          = length(var.subnets)
  availability_zone_id                           = var.subnets[count.index].availability_zone
  cidr_block                                     = var.subnets[count.index].cidr_block
  ipv6_cidr_block                                = var.enable_ipv6 ? cidrsubnet(aws_vpc.this.ipv6_cidr_block, var.ipv6_subnet_netbits, count.index) : null
  assign_ipv6_address_on_creation                = var.enable_ipv6
  enable_resource_name_dns_aaaa_record_on_launch = var.enable_ipv6
  map_public_ip_on_launch                        = var.subnets[count.index].map_public_ip_on_launch
  tags = {
    Name = var.subnets[count.index].name
  }
  vpc_id = aws_vpc.this.id
}
