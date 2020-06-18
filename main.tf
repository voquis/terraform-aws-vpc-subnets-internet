# ---------------------------------------------------------------------------------------------------------------------
# Create VPC
# Provider Docs: https://www.terraform.io/docs/providers/aws/r/vpc.html
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = var.name
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Create subnets in VPC
# Provider Docs: https://www.terraform.io/docs/providers/aws/d/subnet.html
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

# ---------------------------------------------------------------------------------------------------------------------
# Create optional internet gateway
# Provider Docs: https://www.terraform.io/docs/providers/aws/d/internet_gateway.html
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_internet_gateway" "this" {
  count  = var.internet_gateway == true ? 1 : 0
  vpc_id = aws_vpc.this.id
}

# ---------------------------------------------------------------------------------------------------------------------
# If internet gateway requested, create route table between VPC and internet gateway
# Provider Docs: https://www.terraform.io/docs/providers/aws/r/route_table.html
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_route_table" "this" {
  count  = var.internet_gateway == true ? 1 : 0
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this[0].id
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# If internet gateway requested, add internet gateway route table to main VPC route table
# Provider Docs: https://www.terraform.io/docs/providers/aws/r/main_route_table_association.html
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_main_route_table_association" "this" {
  count          = var.internet_gateway == true ? 1 : 0
  vpc_id         = aws_vpc.this.id
  route_table_id = aws_route_table.this[0].id
}

