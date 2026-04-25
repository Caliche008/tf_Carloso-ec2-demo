resource "aws_iam_role" "this" {
  for_each = var.ec2_config

  name = "${var.proyecto}-${each.value.role_name}-${var.cuenta}" # Usamos proyecto y cuenta

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  for_each   = var.ec2_config
  role       = aws_iam_role.this[each.key].name
  policy_arn = each.value.policy_arn
}

resource "aws_iam_role_policy_attachment" "additional_policy" {
  for_each   = var.ec2_config
  role       = aws_iam_role.this[each.key].name
  policy_arn = each.value.policy_arn1
}

resource "aws_iam_instance_profile" "this" {
  for_each = var.ec2_config
  name     = "${var.proyecto}-${each.value.role_name}-profile-${var.cuenta}"
  role     = aws_iam_role.this[each.key].name
}