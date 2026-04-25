resource "aws_security_group" "this" {
  for_each = var.sg_config # Cambiado de security_group_config a sg_config

  name        = "${var.proyecto}-${each.key}-${var.cuenta}" # Usamos proyecto y cuenta
  description = each.value.description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = each.value.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.proyecto}-sg"
  }
}

output "security_group_ids" {
  value = { for k, v in aws_security_group.this : k => v.id }
}