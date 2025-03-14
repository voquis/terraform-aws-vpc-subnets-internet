# ---------------------------------------------------------------------------------------------------------------------
# Bring default security group created by default under Terraform management. Note that no resource is actually created
# Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.this.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
