Terraform AWS module for VPC, subnets and internet routing
===

Terraform 0.12 module to create a vpc with a list of subnets and optional internet routing.

Example:
```terraform
provider "aws" {
  version = "2.65.0"
}

module "networking" {
  source           = "voquis/vpc-subnets-internet/aws"
  version          = "0.0.1"
  name             = "website"
  internet_gateway = true
  cidr_block       = "10.0.0.0/16"
  subnets = [
    {
      availability_zone       = "euw2-az1"
      cidr_block              = "10.0.0.0/24"
      map_public_ip_on_launch = true
      name                    = "website_subnet_1"
    },
    {
      availability_zone       = "euw2-az2"
      cidr_block              = "10.0.1.0/24"
      map_public_ip_on_launch = true
      name                    = "website_subnet_2"
    },
    {
      availability_zone       = "euw2-az3"
      cidr_block              = "10.0.2.0/24"
      map_public_ip_on_launch = true
      name                    = "website_subnet_3"
    },
  ]
}
```