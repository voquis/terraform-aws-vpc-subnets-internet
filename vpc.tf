# ---------------------------------------------------------------------------------------------------------------------
# Create VPC
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  assign_generated_ipv6_cidr_block = var.enable_ipv6 && var.ipv6_ipam_pool_id == null
  ipv6_ipam_pool_id                = var.enable_ipv6 ? var.ipv6_ipam_pool_id : null
  ipv6_netmask_length              = var.enable_ipv6 ? var.ipv6_netmask_length : null

  tags = {
    Name = var.name
  }
}
