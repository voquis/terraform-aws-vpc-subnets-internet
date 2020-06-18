variable "name" {
  description = "VPC name"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "VPC instance tenancy (default or dedicated)"
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Hostnames"
  type        = bool
  default     = true
}

variable "subnets" {
  description = "List of subnets to create, each item should be a map of availabilty zone id and cidr block"
  type = list(object({
    availability_zone       = string
    cidr_block              = string
    map_public_ip_on_launch = bool
    name                    = string
  }))
  default = [
    {
      availability_zone       = "euw2-az1"
      cidr_block              = "10.0.0.0/24"
      map_public_ip_on_launch = true
      name                    = "subnet 1"
    },
    {
      availability_zone       = "euw2-az2"
      cidr_block              = "10.0.1.0/24"
      map_public_ip_on_launch = true
      name                    = "subnet 2"
    },
    {
      availability_zone       = "euw2-az3"
      cidr_block              = "10.0.2.0/24"
      map_public_ip_on_launch = true
      name                    = "subnet 3"
    }
  ]
}

variable "internet_gateway" {
  description = "Whether to create an internet gateway"
  type        = bool
  default     = true
}
