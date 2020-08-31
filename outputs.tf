output "vpc" {
  value = aws_vpc.this
}

output "subnets" {
  value = aws_subnet.this
}

output "internet_gateway" {
  value = aws_internet_gateway.this
}

output "route_table" {
  value = aws_route_table.this
}

output "main_route_table_association" {
  value = aws_main_route_table_association.this
}

output "flow_log" {
  value = aws_flow_log.this
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.this
}
