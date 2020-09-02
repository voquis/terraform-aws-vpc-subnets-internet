output "vpc" {
  value = aws_vpc.this
}

output "subnets" {
  value = aws_subnet.this
}

output "internet_gateway" {
  value = aws_internet_gateway.this
}

output "flow_log" {
  value = aws_flow_log.this
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.this
}
