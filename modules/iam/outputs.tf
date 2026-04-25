output "instance_profile_names" {
  description = "Mapa de nombres de instance profiles creados"
  value       = { for k, v in aws_iam_instance_profile.this : k => v.name }
}

